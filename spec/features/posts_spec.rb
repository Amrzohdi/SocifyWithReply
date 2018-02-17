require 'rails_helper'

RSpec.feature "Posts", type: :feature, js: true do
  describe "create" do
    it "should create posts" do
      sign_in!(create(:user))
      visit "/"
      page.find("#post-content").set "my first post from factoryBot"
      click_on "Post"
      expect(page).to have_content("my first post from factoryBot")
    end
  end

  describe "destroy" do
    it "should destroy post" do
      sign_in!(create(:user))
      create(:post)
      post_content= create(:post).content
      post_count = Post.count
      visit "/"
      within "#post-#{Post.first.id}" do
        page.find("a.btn-danger").click
      end
      expect(page).to have_no_content(post_content)
      expect(Post.count).to eq(post_count-1)
    end
  end
end
