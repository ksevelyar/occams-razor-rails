# frozen_string_literal: true

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'localhost:4000'
    resource '*', credentials: true, headers: :any,
                  methods: %i[get post patch delete options head]
  end
end
