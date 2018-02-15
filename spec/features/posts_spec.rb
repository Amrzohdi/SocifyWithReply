require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  describe "hell" do
    it "should fuck" do
      visit "/"
      expect(page).to have_content("Socify is an")
    end
  end
end
