class Order < ApplicationRecord
  # attr_accessor :token

  belongs_to :user
  has_one :address
  belongs_to :item
  # validates :price, presence: true
  # validates :token, presence: true
end
