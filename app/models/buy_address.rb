class BuyAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :prefecture_id, :municipalities, :address, :building_name, :telephone, :buy, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :user_id
    validates :municipalities
    validates :address
    validates :telephone, length: { maximum: 11 }
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :token
  end


  def save
    buy = Buy.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities, building_name: building_name, telephone: telephone, address: address, buy_id: buy.id)
  end
end