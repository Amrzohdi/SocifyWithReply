require 'rails_helper'
require 'helpers/comments'

RSpec.configure do |c|
  c.include Comments
end


RSpec.feature "Comments", type: :feature, js: true do
  describe "create" do
    let!(:post){create(:post)}
    let(:user){create(:user)}
    it "should be success" do
      comments_count = Comment.count
      visit_fill_comment "comment created for #{User.first.name}"
      expect(page).to have_content("comment created for #{User.first.name}")
      expect(comments_count).to eq(Comment.count-1)
    end
    it "cant't create empty comment" do
      comments_count = Comment.count
      visit_fill_comment
      expect(comments_count).to eq(Comment.count)
    end

  end
end
