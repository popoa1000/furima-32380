class BuyerOrder
  
  include ActiveModel::Model
  attr_accessor :item, :user, :postal_code, :shipment_id, :municipality, :address, :building, :phone_number, :order

  with_options presence: true do
    validates :item, :user, :municipality, :address
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :shipment_id, numericality: { other_than: 1, message: 'Select' }
    validates :phone_number, numericality: { with: /\A\d{10,11}\z/ }
  end
  validates :building

  def save
    # ユーザーの情報を保存し、「user」という変数に入れている
    user = User.create(name: name, name_reading: name_reading, nickname: nickname)
    # 住所の情報を保存
    Address.create(postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building_name: building_name,user_id: user.id)
    # 寄付金の情報を保存
    Donation.create(price: price, user_id: user.id)
  end

end


item      | references | null: false, foreign_key:true |
| user      | references | null: false, foreign_key:true |
postal_code   | string     | null: false                   |
| shipment_id   | integer    | null: false                   |
| municipality  | string     | null: false                   |
| address       | string     | null: false                   |
| building      | string     |                               |
| phone_number  | string     | null: false                   |
| buy           | references | null: false, foreign_key:true