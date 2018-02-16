FactoryBot.define do
  factory :user do
    sequence(:email) {|n| "abigail@connelly#{n}.com"}
    name "Jena Farrell"
    confirmed_at DateTime.now
    password "password"
    password_confirmation "password"
  end
end