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
        expect(page).to have_button("reply")
        expect(page).to have_field("reply[comment]")
      end
    end

    it "replies visible only within a specific comment" do
      user = create(:user)
      create(:post)
      create_list(:comment, 3)
      sign_in!(user)
      visit "posts/#{Post.first.id}"
      within "#comment-#{Comment.second.id}" do
        fill_in "reply[comment]",with: "this is my first reply section"
        click_on "reply"
        expect(page).to have_content("this is my first reply section")
      end
      expect(page.all("p", text:"this is my first reply section").count).to eq(1)
    end

    it "reply to a reply" do
      user = create(:user)
      create(:post)
      create_list(:comment, 3)
      reply1= create(:reply)
      create(:reply, commentable: Comment.second)
      sign_in!(user)
      visit "posts/#{Post.first.id}"
      within "#reply_to_comment-#{reply1.id}" do
        fill_in "reply[comment]", with: "this is a reply inside a reply"
        click_on "reply"
      end
      within "#comment-#{reply1.id}" do
        expect(page).to have_content("this is a reply inside a reply")
      end
      expect(page.all("p",text: "this is a reply inside a reply").count).to eq(1)
    end
  end

  describe "destroy" do
    it "have destroy button" do
      user = create(:user)
      create(:post)
      create_list(:comment, 3)
      create_list(:reply, 3)
      reply1 = create(:reply, commentable: Comment.second)
      create(:reply, commentable: Comment.third)
      sign_in!(user)
      visit "posts/#{Post.first.id}"
      within "#comment-#{reply1.id}" do
        click_on "destroy-#{reply1.id}"
      end
      expect(page).not_to have_content(reply1.comment)
      expect(Comment.find_by_id(reply1)).to be_nil
    end
  end
end
