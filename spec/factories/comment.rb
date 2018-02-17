FactoryBot.define do
  factory :comment do
    sequence(:comment) {|n| "this is comment ##{n}"}
    commentable_id {Post.first.id || create(:post).id}
    commentable_type "Post"
    user {User.first || association(:user)}
  end
end