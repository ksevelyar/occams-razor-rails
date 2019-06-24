# frozen_string_literal: true

require 'rails_helper'

shared_examples 'jwt_session' do
  it 'returns http success' do
    expect(response).to have_http_status(:success)
  end

  it 'returns access cookie' do
    expect(response.cookies[JWTSessions.access_cookie]).to be_present
  end

  it 'returns csrf' do
    expect(json_body.keys).to eq ['csrf']
  end
end

describe SessionsController, type: :controller do
  describe 'POST #create' do
    let(:user_params) { attributes_for(:user) }
    let(:password) { user_params[:password] }
    let!(:user) { create :user, user_params }

    context 'when password is correct' do
      before do
        post :create, params: user_params
      end

      it_behaves_like 'jwt_session'
    end

    it 'returns unauthorized for invalid params' do
      post :create, params: { email: user.email, password: 'incorrect' }
      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe 'PATCH #update' do
    let(:user) { create :user }
    let(:expired_jwt_service) { JWTService.new(user_id: user.id) }

    before do
      request.cookies[JWTSessions.access_cookie] = expired_jwt_service.access_token
      request.headers[JWTSessions.csrf_header] = expired_jwt_service.csrf
    end

    context 'when expired' do
      before do
        Timecop.freeze(Time.zone.now + JWTSessions.access_exp_time) { post :update }
      end

      it_behaves_like 'jwt_session'
    end

    context 'when not expired' do
      it 'raises unathorized' do
        post :update
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
