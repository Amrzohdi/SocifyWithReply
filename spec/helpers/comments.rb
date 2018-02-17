module Comments
  def visit_fill_comment(comment="")
    sign_in!(user)
    visit "posts/#{post.id}"
    within "#new_comment" do
      fill_in "comment[comment]", with: comment
      click_on "comment"
    end
  end
end