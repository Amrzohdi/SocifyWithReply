FactoryBot.define do
  factory :reply, class: :comment do
    sequence(:comment) {|n| "this is reply ##{n}"}
    user {User.first || association(:user)}
    commentable {Comment.first || create(:comment)}
  end
end