# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    content { Faker::Books::Dune.quote }
    description { Faker::Books::Dune.quote('baron_harkonnen') }
    title { Faker::Books::Dune.unique.title }
    published { true }
    published_at { Faker::Time.between(1.year.ago, Time.zone.today) }
    user
  end
end
