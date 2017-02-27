class NewAdPage
  include PageObject
  include ErrorMsg

  text_field(:ad_name, id: 'input_0')
  text_field(:street, id: 'input_1')
  text_field(:rooms, id: 'input_2')
  text_field(:price, id: 'input_3')
  button(:save_ad, css: 'button[ng-click="$ctrl.saveAdvertisementDetails()"]')

  def loaded?
    save_ad_element.visible?
  end

  def save_ad_info(info)
    self.ad_name = info.ad_name
    self.street = info.street
    self.rooms = info.rooms
    self.price = info.price
    save_ad
    wait_until { !ad_name_element.visible? }
  end

  def input_price(price)
    self.price = ''
    self.price = price
    self.rooms_element.click
  end

  def input_ad_name(ad_name)
    self.ad_name = ''
    self.ad_name = ad_name
    self.rooms_element.click
  end

  def has_save_button_enabled?
    save_ad_element.enabled?
  end

end