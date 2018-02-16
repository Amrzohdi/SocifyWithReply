require 'rails_helper'

RSpec.feature "Posts", type: :feature, js: true do
  describe "hell" do
    it "should fuck" do
      sign_in!(create(:user))
    end
  end
end
