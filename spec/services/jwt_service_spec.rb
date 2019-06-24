# frozen_string_literal: true

require 'rails_helper'

describe JWTService, type: :service do
  let(:user) { create :user }

  context 'when log in' do
    let(:payload) { { user_id: user.id } }
    let(:jwt_service) { described_class.new(payload) }

    it 'returns access cookie' do
      expect(jwt_service.cookie.first).to eq JWTSessions.access_cookie
    end

    it 'returns csrf' do
      expect(jwt_service.csrf).to be_present
    end
  end

  context 'when refresh' do
  end
end
