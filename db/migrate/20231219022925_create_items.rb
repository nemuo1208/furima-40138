class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name                       ,null: false
      t.integer :price                     ,null: false
      t.text :explanation                  ,null: false
      t.integer :category_id               ,null: false
      t.integer :product_condition_id      ,null: false
      t.integer :delivery_charge_id        ,null: false
      t.integer :area_of_origin_id         ,null: false
      t.integer :days_to_ship_id           ,null: false
      t.references :user                   ,null: false, foreign_key: true
      t.timestamps 
    end
  end
end
