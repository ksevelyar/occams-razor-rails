# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    content { Faker::Books::Dune.quote }
    description { Faker::Books::Dune.quote('baron_harkonnen') }
    title { Faker::Books::Dune.unique.title }
    user
  end
end
