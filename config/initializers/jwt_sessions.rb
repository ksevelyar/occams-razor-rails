# frozen_string_literal: true

JWTSessions.algorithm = 'HS512'
JWTSessions.encryption_key = Rails.application.credentials.jwt_encryption_key
