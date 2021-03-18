class Order < ApplicationRecord
  attr_accessor :price, :token
  validates :price, presence: true
  validates :token, presence: true
end
