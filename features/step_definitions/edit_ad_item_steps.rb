When(/^I click an item to edit$/) do
  on(HomePage).wait_until { @current_page.loaded? }
  on(HomePage).click_an_item(@ad_info.ad_name)
  on(NewAdPage).wait_until { @current_page.loaded? }
  @new_ad_info = Advertisement.new
  @new_ad_info.rooms = '3'
  on(EditAdPage).update_ad_info(@new_ad_info)
end

Then(/^the add is updated with new info$/) do
  on(HomePage).wait_until { @current_page.loaded? }
  get_added_item = on(HomePage).get_item_info_by_name(@new_ad_info.ad_name)
  expect(get_added_item[0].text.eql?@new_ad_info.ad_name).to be true
  expect(get_added_item[1].text.eql?@new_ad_info.street).to be true
  expect(get_added_item[2].text.eql?@new_ad_info.rooms).to be true
  expect(get_added_item[3].text.include?@new_ad_info.price).to be true
end