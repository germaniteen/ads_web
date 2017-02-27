class Advertisement
  attr_accessor :ad_name, :street, :rooms, :price, :active

  def initialize(info={})
    @ad_name = info[:ad_name] || Faker::Name.first_name
    @street = info[:street] || Faker::Address.street_address
    @rooms = info[:rooms] || '2'
    @price = info[:price] || '200'
    @active = info[:active] || false
  end

end