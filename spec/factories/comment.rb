FactoryBot.define do
  factory :comment do
    sequence(:comment) {|n| "this is comment ##{n}"}
    commentable {Post.first || create(:post)}
    user {User.first || association(:user)}
  end
end