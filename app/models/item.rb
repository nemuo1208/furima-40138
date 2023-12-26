class Item < ApplicationRecord

  validates :name, presence: true, length: { maximum: 40 }
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than: 9999999 }
  validates :explanation, presence: true, length: { maximum: 1000 }
  validates :category_id, presence: true, numericality: { other_than: 1 }
  validates :product_condition_id, presence: true, numericality: { other_than: 1 }
  validates :delivery_charge_id, presence: true, numericality: { other_than: 1 }
  validates :area_of_origin_id, presence: true, numericality: { other_than: 1 }
  validates :days_to_ship_id, presence: true, numericality: { other_than: 1 }
  validates :image, presence: true


  belongs_to :user
  # has_one :purchases_record
  has_one_attached :image
  has_many :orders
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_condition
  belongs_to :delivery_charge
  belongs_to :area_of_origin
  belongs_to :days_to_ship

end
