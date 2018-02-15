def closeNewTabs
  window = page.driver.browser.window_handles

  if window.size > 1
    page.driver.browser.switch_to.window(window.last)
    page.driver.browser.close
    page.driver.browser.switch_to.window(window.first)
  end
end