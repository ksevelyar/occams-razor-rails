# frozen_string_literal: true

class SessionsController < ApplicationController
  def create
    user = User.find_by!(email: params[:email])

    if user.authenticate(params[:password])
      jwt_service = JWTService.new(user_id: user.id)
      response.set_cookie(*jwt_service.cookie)

      render json: { csrf: jwt_service.csrf }
    else
      not_authorized
    end
  end

  def update
    authorize_refresh_by_access_request!

    jwt_service = JWTService.new(claimless_payload)
    jwt_service.refresh
    response.set_cookie(*jwt_service.cookie)

    render json: { csrf: jwt_service.csrf }
  end

  def destroy
    JWTService.new(claimless_payload).flush
    render json: :ok
  end

  private

  def build_session
    JWTSessions::Session.new(payload: payload)
  end
end
