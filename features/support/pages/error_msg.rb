module ErrorMsg
  include PageObject

  div(:price_error_msg, css: 'div[ng-messages="$ctrl.advertisementForm.price.$error"] div')
  div(:name_error_msg, css: 'div[ng-messages="$ctrl.advertisementForm.name.$error"] div')

  def has_price_error_msg?(text)
    wait_until { self.price_error_msg_element.visible? }
    price_error_msg_element.text.eql? text
  end

  def has_name_error_msg?(text)
    wait_until { self.name_error_msg_element.visible? }
    name_error_msg_element.text.eql? text
  end
end