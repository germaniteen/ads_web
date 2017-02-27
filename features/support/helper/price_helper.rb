module PriceHelper

  def self.euro_format price
    price.to_s + ',00'
  end

end