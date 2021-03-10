class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  

  with_options presence: true do
    validates :product, :description, :image
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: 'Out of setting range'}
    with_options numericality: { other_than: 1 ,message: "Select"}do
      validates :category_id, :condition_id, :charge_id, :shipment_id, :day_id
    end
  end

  belongs_to :category
  belongs_to :condition
  belongs_to :charge
  belongs_to :shipment
  belongs_to :day

  belongs_to :user
  has_many :comments
  #has_one :buy
  has_one_attached :image
end
