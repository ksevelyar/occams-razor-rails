# frozen_string_literal: true

# The data can be loaded with the rails db:seed command / db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Rails.env.development?
  User.create(
    name: 'admin',
    email: 'admin@domain.tld',
    password: 'password',
    password_confirmation: 'password',
    admin: true
  )

  10.times { FactoryBot.create :post }
end
