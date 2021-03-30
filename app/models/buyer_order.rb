class BuyerOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :shipment_id, :municipality, :address, :building, :phone_number,
                              :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :shipment_id, numericality: { other_than: 1, message: 'Select' } 
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/}
    validates :municipality, :address, :token
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Buyer.create(postal_code: postal_code, shipment_id: shipment_id, municipality: municipality, address: address, building: building, phone_number: phone_number, order_id: order.id)
  end

end