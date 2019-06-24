# frozen_string_literal: true

module ResponseParser
  def json_body
    JSON.parse(response.body)
  end
end
