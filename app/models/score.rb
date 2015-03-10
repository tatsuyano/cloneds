# -*- coding: utf-8 -*-
class Score < ActiveRecord::Base
  belongs_to :user
  belongs_to :task

  validates :user_id, presence: true # 値が必須
  validates :task_id, presence: true
  validates :user_id, numericality: { only_integer: true } # 数値のみ有効
  validates :task_id, numericality: { only_integer: true }

  def self.count_up_or_down(user_id,task_id)
    score = self.where("task_id = ? AND DATE(created_at) = DATE(?)",task_id, Time.now).limit(1).first

    if score.blank?
      score = self.new(user_id: user_id, task_id: task_id)
      score.save
    else
      score.destroy
    end
  end

end
