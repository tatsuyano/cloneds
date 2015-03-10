# -*- coding: utf-8 -*-
class Task < ActiveRecord::Base
  has_many :scores, dependent: :destroy
  belongs_to :user

  validates :user_id, presence: true
  validates :user_id, numericality: { only_integer: true }
  validates :title, presence: true

  def completed?
    score = self.scores.where("DATE(created_at) = DATE(?)",Time.now).limit(1).first
    score.present?
  end
end
