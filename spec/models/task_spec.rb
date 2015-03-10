# -*- coding: utf-8 -*-
require 'rails_helper'

describe Task do
  it { is_expected.to validate_presence_of(:user_id) }
  it { is_expected.to validate_numericality_of(:user_id).only_integer }
  it { is_expected.to validate_presence_of(:title) }
end
