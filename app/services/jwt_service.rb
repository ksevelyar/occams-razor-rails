# frozen_string_literal: true

class JWTService
  def initialize(payload)
    @payload = payload
  end

  def cookie
    [
      JWTSessions.access_cookie,
      value: access_token,
      httponly: true,
      secure: Rails.env.production?
    ]
  end

  def csrf
    tokens[:csrf]
  end

  def access_token
    tokens[:access]
  end

  def refresh
    @tokens = session.refresh_by_access_payload do
      raise JWTSessions::Errors::Unauthorized, '⚡⚡⚡ Prohodimec ⚡⚡⚡'
    end
  end

  def flush
    session.flush_by_access_payload
  end

  private

  def session
    JWTSessions::Session.new(payload: @payload, refresh_by_access_allowed: true)
  end

  def tokens
    @tokens ||= session.login
  end
end
