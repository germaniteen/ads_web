class HomePage
  include PageObject

  HOMEPAGE_URL ||= Fixtures['urls.base']

  link(:add_new_ad, class: 'al-add__button')
  table(:ads_list, css: '.md-table.ng-isolate-scope')
  span(:list_changed_toast, css: '.md-toast-text.ng-binding')

  page_url(HOMEPAGE_URL)

  def loaded?
    add_new_ad_element.visible?
  end

  def click_add_new_ad(open_new_tab = false)
    if open_new_tab
      #url = add_new_ad_element.attribute('href')
      #@browser.execute_script("window.open('"+ url + "','_newtab');")
      @browser.element(class: 'al-add__button').click(:command)
      @browser.window(:index => @browser.windows.count-1).use
    else
      add_new_ad
    end
  end

  def move_tab(index=0)
    @browser.window(:index => index).use
  end

  def count_ads_item
    ads_list_element.count
  end

  def get_item_info_by_name ad_name
    (0..ads_list_element.count - 1).each do |i|
      return ads_list_element[i] if ads_list_element[i][0].text == ad_name
    end
  end

  def click_an_item ad_name
    (0..ads_list_element.count - 1).each do |i|
      return ads_list_element[i].click if ads_list_element[i][0].text == ad_name
    end
  end

  def click_sort_ad_name
    ads_list_element[0][0].click
  end

  def has_ad_name_sort_acs?
    ad_name_list = []
    click_sort_ad_name
    (1..ads_list_element.count - 1).each do |i|
      ad_name_list << ads_list_element[i][0].text
    end
    if ad_name_list == ad_name_list.sort
      true
    else
      click_sort_ad_name
      false
    end
  end

  def has_list_changed_toast?
    wait_until { list_changed_toast_element.visible? }
    list_changed_toast_element.visible?
  end

end
