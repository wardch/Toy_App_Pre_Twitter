# This file should contain all the record creation needed to
# seed the database with its default values.
# The data can then be loaded with the rake db:seed
# (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.create!(name: 'Charlie',
                    email: 'charlie@charlie.com',
                    password: 'charlie',
                    password_confirmation: 'charlie',
                    activated: true,
                    activated_at: Time.zone.now,
                    admin: true)

99.times do |n|
  name = %w(charlie barley warly carly jiminez scooter perciville lorcan BroBradly).sample
  email = "#{name}.#{n}@gmail.com"
  password = 'password'
  password_confirmation = 'password'
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

users = User.take(6)

50.times do
  content = Faker::Hipster.sentence(5)
  users.each { |user| user.microposts.create!(content: content)}
end
