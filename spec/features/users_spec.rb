require 'rails_helper'

RSpec.feature "Users", type: :feature, js: true do
  describe "user login" do

    it "login successfully" do
      sign_in!(create(:user))
      assert_current_path home_path
    end

    it "couldn't login" do
      user = double(:user)
      allow(user).to receive("email").and_return("amr@gmail.com")
      allow(user).to receive("password").and_return("password")
      sign_in!(user)
      assert_current_path new_user_session_path
      expect(page).to have_content("Invalid Email or password.")
    end
  end
end
