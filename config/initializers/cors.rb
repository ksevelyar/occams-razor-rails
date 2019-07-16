# frozen_string_literal: true

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'nuxt:4000', 'localhost:4000'
    resource '*', credentials: true, headers: :any,
                  methods: %i[get post patch delete options head]
  end
end
