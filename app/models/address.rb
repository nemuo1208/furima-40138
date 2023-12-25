class Address < ApplicationRecord
  
  validates :order                , presence: true
  validates :postcode             , presence: true
  validates :area_of_origin_id    , presence: true
  validates :city                 , presence: true
  validates :block                , presence: true
  validates :phone_number         , presence: true, format: { with: /\A\d{10,11}\z/ }
  
  
  belongs_to :order
  
end
