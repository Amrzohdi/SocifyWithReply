module CapybaraHelper
  def find_and_click(matcher)
    find(matcher).click
  end
end

RSpec.configure do |config|
  config.include CapybaraHelper, type: :feature
end