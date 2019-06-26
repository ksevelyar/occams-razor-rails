# frozen_string_literal: true

require 'rails_helper'

describe Post, type: :model do
  describe 'validations' do
    subject { build :post }

    it { is_expected.to validate_presence_of :content }
    it { is_expected.to validate_presence_of :description }
    it { is_expected.to validate_presence_of :title }

    it { is_expected.to validate_uniqueness_of(:slug).case_insensitive }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end
end
