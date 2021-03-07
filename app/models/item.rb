class Item < ApplicationRecord
  belong_to :user
  has_many :comments
  #has_one :buy
  has_one_attached :image
end
