# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    name { Faker::Internet.user_name }
    password { Faker::Internet.password }
    password_confirmation { password }
  end
end
