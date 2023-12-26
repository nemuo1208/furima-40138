class OrderAddress
  include ActiveModel::Model
  attr_accessor :postcode, :area_of_origin_id, :city, :block, :building, :user_id, :item_id, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :city
    validates :block
    validates :phone_number, format: { without: /\A\d{1,3}-\d{1,4}-\d{4}\z/, message: 'is invalid' }, length: { maximum: 11, minimum: 10 }
    validates :token
    validates :area_of_origin_id, numericality: { other_than: 0, message: "can't be blank" }
  end
  def save
    # 寄付情報を保存し、変数donationに代入する
    order = Order.create(item_id: item_id, user_id: user_id)
    # 住所を保存する
    # donation_idには、変数donationのidと指定する
    Address.create(postcode: postcode, area_of_origin_id: area_of_origin_id, city: city, block: block, building: building, order_id: order.id, phone_number: phone_number)
  end
end
