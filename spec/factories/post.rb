FactoryBot.define do
  factory :post do
    user {User.first || association(:user) }
    sequence(:content)  {|n| "post number #{n}"}
  end
end