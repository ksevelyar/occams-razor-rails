# frozen_string_literal: true

require 'rails_helper'

describe User, type: :model do
  describe 'validations' do
    subject { build :user }

    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  end

  describe 'associations' do
    it { is_expected.to have_many(:posts).dependent(:destroy) }
  end
end
