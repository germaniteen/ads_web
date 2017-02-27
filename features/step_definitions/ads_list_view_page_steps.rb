When(/^I visit the (.*)$/) do |page|
  visit_page_and_count_time(page)
end

When(/^I click the add new add button$/) do
  on(HomePage).wait_until { @current_page.loaded? }
  on(HomePage).click_add_new_ad
  on(NewAdPage).wait_until { @current_page.loaded? }
end

When(/^I open new ad form in another tab$/) do
  on(HomePage).wait_until { @current_page.loaded? }
  on(HomePage).click_add_new_ad(true)
  on(NewAdPage).wait_until { @current_page.loaded? }
end

When(/^I add the new ad$/) do
  on(HomePage).wait_until { @current_page.loaded? }
  @ad_items = on(HomePage).count_ads_item
  on(HomePage).click_add_new_ad
  on(NewAdPage).wait_until { @current_page.loaded? }
  @ad_info = Advertisement.new
  on(NewAdPage).save_ad_info(@ad_info)
end

When(/^I add the new ad using alphabetical for currency format$/) do
  on(HomePage).wait_until { @current_page.loaded? }
  on(HomePage).click_add_new_ad
  on(NewAdPage).wait_until { @current_page.loaded? }
  invalid_price = Fixtures['ad_info.invalid_price.alphabetical']
  on(NewAdPage).input_price(invalid_price)
end

When(/^I add the new ad with blank ad name$/) do
  on(HomePage).wait_until { @current_page.loaded? }
  on(HomePage).click_add_new_ad
  on(NewAdPage).wait_until { @current_page.loaded? }
  on(NewAdPage).input_ad_name('')
end

When(/^I add the new ad with space ad name$/) do
  on(HomePage).wait_until { @current_page.loaded? }
  on(HomePage).click_add_new_ad
  on(NewAdPage).wait_until { @current_page.loaded? }
  on(NewAdPage).input_ad_name(' ')
end

When(/^I add the new ad with more than 50 character ad name$/) do
  on(HomePage).wait_until { @current_page.loaded? }
  on(HomePage).click_add_new_ad
  on(NewAdPage).wait_until { @current_page.loaded? }
  on(NewAdPage).input_ad_name(Fixtures['ad_info.long_ad_name'])
end

When(/^I have new add info$/) do
  @ad_info = Advertisement.new
end

When(/^I input valid ad name$/) do
  on(NewAdPage).input_ad_name(@ad_info.ad_name)
end

When(/^I input valid price$/) do
  on(NewAdPage).input_price(@ad_info.price)
end

When(/^I click the sort icon on the ad name$/) do
  on(HomePage).wait_until { @current_page.loaded? }
  on(HomePage).click_sort_ad_name
end

When(/^I save the new ad info$/) do
  on(NewAdPage).save_ad_info(@ad_info)
end

When(/^I move to previous tab$/) do
  on(HomePage).move_tab
end

Then(/^the new ad is added$/) do
  on(HomePage).wait_until { @current_page.loaded? }
  after_added_ad_items = on(HomePage).count_ads_item
  get_added_item = on(HomePage).get_item_info_by_name(@ad_info.ad_name)
  expect(after_added_ad_items == @ad_items + 1).to be true
  expect(get_added_item[0].text.eql?@ad_info.ad_name).to be true
  expect(get_added_item[1].text.eql?@ad_info.street).to be true
  expect(get_added_item[2].text.eql?@ad_info.rooms).to be true
  expect(get_added_item[3].text.include?@ad_info.price).to be true
end

Then(/^I should see the error message regarding the invalid price$/) do
  expect(on(NewAdPage)).to have_price_error_msg(Fixtures['error_msg.invalid_price'])
end

Then(/^I should see the error message regarding the blank ad name$/) do
  expect(on(NewAdPage)).to have_name_error_msg(Fixtures['error_msg.blank_ad_name'])
end

Then(/^I should see the error message regarding the invalid ad name$/) do
  expect(on(NewAdPage)).to have_name_error_msg(Fixtures['error_msg.invalid_ad_name'])
end

Then(/^I should see the error message regarding the ad name reached its length$/) do
  expect(on(NewAdPage)).to have_name_error_msg(Fixtures['error_msg.max_length_reached'])
end

Then(/^I should see the save button is disabled$/) do
  expect(on(NewAdPage)).not_to have_save_button_enabled
end

Then(/^I should see the save button is enabled$/) do
  expect(on(NewAdPage)).to have_save_button_enabled
end

Then(/^I should see the list is ascending$/) do
  expect(on(HomePage)).to have_ad_name_sort_acs
end

Then(/^I should see the list is descending$/) do
  expect(on(HomePage)).not_to have_ad_name_sort_acs
end

Then(/^I should see the list changed toast$/) do
  on(HomePage).wait_until { @current_page.loaded? }
  expect(on(HomePage)).to have_list_changed_toast
end





