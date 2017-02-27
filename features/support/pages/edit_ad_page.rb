class EditAdPage
  include PageObject

  text_field(:ad_name, id: 'input_5')
  text_field(:street, id: 'input_6')
  text_field(:rooms, id: 'input_7')
  text_field(:price, id: 'input_8')
  button(:save_ad, css: 'button[ng-click="$ctrl.saveAdvertisementDetails()"]')

  def loaded?
    save_ad_element.visible?
  end

  def update_ad_info(info)
    self.ad_name = info.ad_name
    self.street = info.street
    self.rooms = info.rooms
    self.price = info.price
    save_ad
  end

end