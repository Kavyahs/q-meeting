# This will guess the User class
FactoryGirl.define do
  factory :user do
    sequence :name do |n|
      "User #{n}"
    end
    sequence :username do |n|
      "user#{n}"
    end
    sequence :email do |n|
      "user#{n}@yopmail.com"
    end
    sequence :auth_token do |n|
      "auth_token_{n}"
    end
    token_expires_at { Time.now }
  end
end