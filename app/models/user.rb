# -*- coding: utf-8 -*-
class User < ActiveRecord::Base
  has_many :tasks,  dependent: :destroy
  has_many :scores, dependent: :destroy

  validates :rand_code, presence: true
  validates :rand_code, uniqueness: true

  after_initialize :set_rand_code

  # http://stackoverflow.com/questions/11998902/highcharts-doesnt-work-on-heroku
  def high_chart
    LazyHighCharts::HighChart.new('graph') do |f|
      if self.tasks.count > 0
        f.title(text: 'day score')
        f.xAxis(categories: categories)
        f.series(name: 'ノルマ', data: quota, type: "column",color: "#FF9933")
      end
      f.series(name: '達成率', data: completion, type: "column",color: "#3399FF") if self.scores.count > 0
    end
  end

  def score_of_total
    my_score('total')
  end

  def score_of_month
    my_score('month')
  end

  def score_of_week
    my_score('week')
  end

  def score_of_today
    my_score('today')
  end

  private
  def daily_tasks
    Task.select("to_char(created_at,'YYYY-MM-DD') AS day, COUNT(to_char(created_at,'YYYY-MM-DD')) AS cnt")
      .where("user_id = ?",self.id)
      .group("day")
  end

  def daily_scores
    Score.select("to_char(created_at,'YYYY-MM-DD') AS day, COUNT(to_char(created_at,'YYYY-MM-DD')) AS cnt")
      .where("user_id = ?",self.id)
      .group("day")
  end

  def categories
    if @categories.blank?
      from_day = Date.strptime(daily_tasks.order('day').limit(1).first.day,'%Y-%m-%d')
      to_day   = Date.today

      @categories = []
      while from_day <= to_day
        @categories.push(from_day)
        from_day = from_day.next
      end
    end
    @categories
  end

  def quota
    if @quota.blank?
      hash = {}
      daily_tasks.all.each do |task|
        hash[task.day] = task.cnt
      end
      categories if @categories.blank?

      @quota = []
      quota  = 0
      @categories.each do |day|
        quota += hash[day.to_s] if hash[day.to_s].present?
        @quota.push(quota)
      end
    end
    @quota
  end

  def completion
    if @completion.blank?
      hash = {}
      daily_scores.all.each do |score|
        hash[score.day] = score.cnt
      end
      categories if @categories.blank?

      @completion = []
      @categories.each do |day|
        completion = hash[day.to_s] || 0
        @completion.push(completion)
      end
    end
    @completion
  end

  def my_score(period = 'today')
    case period
    when 'today'
      Score.where("user_id = ? AND DATE(created_at) = DATE(?)",self.id,Time.now).count
    when 'week'
      Score.where("user_id = ? AND created_at BETWEEN ? AND ?",
        self.id,Time.now.beginning_of_week(:sunday),Time.now.end_of_week(:sunday)).count
    when 'month'
      Score.where("user_id = ? AND created_at BETWEEN ? AND ?",
        self.id,Time.now.beginning_of_month,Time.now.end_of_month).count
    when 'total'
      Score.where("user_id = ?",self.id).count
    end
  end

  def set_rand_code
    self.rand_code = generate_rand_code if self.rand_code.blank?
  end

  def generate_rand_code
    rand_code = SecureRandom.urlsafe_base64(10)
    User.where(rand_code: rand_code).blank? ? rand_code : generate_rand_code
  end
end
