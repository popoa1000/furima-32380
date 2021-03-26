class BuyerOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :shipment_id, :municipality, :address, :building, :phone_number, :item, :user

  with_opptions presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :shipment_id, numericality: { other_than: 1, message: 'Select' } 
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/}
    validates :municipality, :address, :item, :user
  end

  def save
    order = Order.create(item: item, user: user)
    Buyer.create(postal_code: postal_code, shipment_id: shipment_id, municipality: municipality, address: address, building: building, phone_number: phone_number, order_id: order_id)
  end

end