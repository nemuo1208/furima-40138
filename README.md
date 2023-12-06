


##users

| Column           | Type        |Options                        |
|------------------|-------------|-------------------------------|
| name             | string      |
| email            | string      |
| last_name_zen    | string      |
| first_name_zen   | string      |
| last_name_kana   | string      |
| first_name_kana  | string      |
| date             | integer     |

## Association


- has_many :products_informations
- has_many :purchases_record




##products_information

| Column            | Type        |Options                        |
|-------------------|-------------|-------------------------------|
| name              | string      |
| price             | integer     |
| explanation       | text        |
| category          | string      |
| product_condition | text        | null: false
| delivery_charge   | integer     | null: false
| area_of_origin    | string      | null: false
| days_to_ship      | integer     | null: false
| users_information | references  | null: false, foreign_key: true|
 
## Association

- belongs_to :user
- has_one :purchases_record


##purchases_record

| Column               | Type        |Options                        |
|----------------------|-------------|-------------------------------|
| purchases_record     | text        |
| seller               | string      |
| users                | references  | null: false, foreign_key: true|
| products_information | references  | null: false, foreign_key: true|

## Association

- belongs_to :user
- has_one :shipping_information


##shipping_informations

| Column           | Type        |Options                        |
|------------------|-------------|-------------------------------|
| postal_code      | integer     |
| prefecture       | references  | null: false, foreign_key: true|
| municipalities   | string      |
| house_number     | string      |
| building_name    | string      |
| phone_number     | string      |
| purchases_record | references  | null: false, foreign_key: true|

## Association


- belongs_to :products_information