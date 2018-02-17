require 'rails_helper'

RSpec.feature "Reply", type: :feature, js: true do
  describe "create" do
    it "has reply section" do
      user = create(:user)
      create(:post)
      create(:comment)
      sign_in!(user)
      visit "posts/#{Post.first.id}"
      within "#comment-#{Comment.first.id}" do
        expect(page).to have_content("reply")
      end
    end

    it "can reply" do
      user = create(:user)
      create(:post)
      create(:comment)
      sign_in!(user)
      visit "posts/#{Post.first.id}"
      within "#comment-#{Comment.first.id}" do
        expect(page).to have_content("reply")
        fill_in "reply[comment]",with: "this is my first reply section"
        click_on "reply"
        expect(page).to have_content("this is my first reply section")
      end
    end
  end
end
