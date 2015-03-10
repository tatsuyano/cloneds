# -*- coding: utf-8 -*-
require 'rails_helper'

describe Score do
  it { is_expected.to validate_presence_of(:user_id) }
  it { is_expected.to validate_presence_of(:task_id) }
  it { is_expected.to validate_numericality_of(:user_id).only_integer }
  it { is_expected.to validate_numericality_of(:task_id).only_integer }

  describe "should be counted" do
    let(:user) { User.create(rand_code: 'adkhwkd') }
    let(:task) { Task.create(user_id: user.id, title: 'task1') }

    it "up" do
      Score.count_up_or_down(user.id,task.id)
      expect(user.score_of_total).to be == 1
    end

    it "down" do
      Score.count_up_or_down(user.id,task.id)
      Score.count_up_or_down(user.id,task.id)
      expect(user.score_of_total).to be == 0
    end
  end
end
