


##users

| Column             | Type        |Options                        |
|--------------------|-------------|-------------------------------|
| name               | string      | null: false
| email              | string      | unique: true, null: false     |
| encrypted_password | string      | null: false
| last_name_zen      | string      | null: false
| first_name_zen     | string      | null: false
| last_name_kana     | string      | null: false
| first_name_kana    | string      | null: false
| birthday           | date     　　| null: false

## Association


- has_many :products_informations
- has_many :purchases_records




##products_informations

| Column               | Type        |Options                        |
|----------------------|-------------|-------------------------------|
| name                 | string      | null: false
| price                | integer     | null: false
| explanation          | text        | null: false
| category_id          | integer     | null: false
| product_condition_id | integer     | null: false
| delivery_charge_id   | integer     | null: false
| prefecture_id        | integer     | null: false
| days_to_ship_id      | integer     | null: false
| user                 | references  | null: false, foreign_key: true|
 
## Association

- belongs_to :user
- has_one :purchases_record


##purchases_records

| Column               | Type        |Options                        |
|----------------------|-------------|-------------------------------|
| user                 | references  | null: false, foreign_key: true|
| products_information | references  | null: false, foreign_key: true|

## Association

- belongs_to :user
- has_one :shipping_information
- belongs_to :product_information

##shipping_informations

| Column           | Type        |Options                        |
|------------------|-------------|-------------------------------|
| postal_code      | string      | null: false
| prefecture_id    | integer     | null: false
| municipalities   | string      | null: false
| house_number     | string      | null: false
| building_name    | string      |
| phone_number     | string      | null: false
| purchases_record | references  | null: false, foreign_key: true|

## Association


- belongs_to :products_information