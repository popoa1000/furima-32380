class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :charge
  belongs_to :shipment
  belongs_to :day

  validates :product, :description, presence: true

  with_options numericality: { other_than: 1 }do
    validates :category, :condition, :charge, :shipment, :day
  end

  belongs_to :user
  has_many :comments
  #has_one :buy
  has_one_attached :image
end
