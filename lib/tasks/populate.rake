# lib/tasks/populate.rake
#
# Rake task to populate development database with test data
# Run it with "rake db:populate"
# See Railscast 126 and the faker website for more information

namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'faker'

    Rake::Task['db:reset'].invoke

    # # Create admin_user account
    # admin_user = User.create!(:email => "test@test.org",
    #   :displayName => "test",
    #   :password => "password",
    #   :password_confirmation => "password",
    #   :location => Faker::Address.city,
    #   :miles => true,
    #   :administrator => true)

    # Create test user accounts
    20.times do |n|
      displayName = Faker::Name.name
      email = "test-#{n+1}@test.org"
      password = "password"
      avatar = (0...50).map { ('a'..'z').to_a[rand(26)] }.join
      test_user = User.create!(:name => displayName,
        :email => Faker::Internet.email,
        :password => password,
        :password_confirmation => password,
        :birth_date => Faker::Date.birthday(min_age = 18, max_age = 65),
        :age => Faker::Number.number(2),
        :gender => [0, 1].sample,
        :avatar => Faker::Avatar.image(avatar, "50x50", "jpg"),
        :city => Faker::Address.city)
      end #20.times
  end
end
