require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  describe "hell" do
    it "should fuck" do
      visit "/"
      expect(response.status).to to(:success)
    end
  end
end
