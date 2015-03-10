# -*- coding: utf-8 -*-
require 'rails_helper'

describe User do
  it { is_expected.to validate_presence_of(:rand_code) }
  it { is_expected.to validate_uniqueness_of(:rand_code) }

  describe "returns score" do

    # before の代わりに let
    #before :each do
    #  @user = User.create(rand_code: 'adkhwkd')
    #  @task = Task.create(user_id: @user.id, title: 'task1')
    #end

    # User.new だとDBに保存されない。User.create だとDBに(一時的に)保存される
    let(:user)  { User.create(rand_code: 'adkhwkd') }
    let(:task)  { Task.create(user_id: user.id, title: 'task1') }

    it "of today" do
      Score.create(user_id: user.id, task_id: task.id)
      Score.create(user_id: user.id, task_id: task.id)
      Score.create(user_id: user.id, task_id: task.id)
      expect(user.score_of_today).to be == 3 # 登録されたscoreの件数が3件だと期待
    end

    it "of week" do
      Score.create(user_id: user.id, task_id: task.id, created_at:Date.today.prev_week) # 先週
      Score.create(user_id: user.id, task_id: task.id)
      expect(user.score_of_week).to be == 1
    end

    it "of month" do
      Score.create(user_id: user.id, task_id: task.id, created_at:Date.today.prev_month) # 先月
      Score.create(user_id: user.id, task_id: task.id)
      expect(user.score_of_month).to be == 1
    end

    it "of total" do
      Score.create(user_id: user.id, task_id: task.id, created_at:Date.today.prev_month) # 先月
      Score.create(user_id: user.id, task_id: task.id, created_at:Date.today.prev_week)  # 先週
      Score.create(user_id: user.id, task_id: task.id)  # 今日
      expect(user.score_of_total).to be == 3
    end
  end

end
