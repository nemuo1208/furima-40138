FactoryBot.define do
  factory :item do
    name                    { 'パソコン' }
    price                   { '1000' }
    explanation             { 'オンボロ' }
    category_id             { '2' }
    product_condition_id    { '2' }
    delivery_charge_id      { '2' }
    area_of_origin_id       { '2' }
    days_to_ship_id         { '2' }


    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

