


##users_information

| Column           | Type        |Option                         |
|------------------|-------------|-------------------------------|
| name             | string      | null: false, foreign_key: true|
| mail             | string      | null: false, foreign_key: true|
| last_name_zen    | string      | null: false, foreign_key: true|
| first_name_zen   | string      | null: false, foreign_key: true|
| last_name_kana   | string      | null: false, foreign_key: true|
| first_name_kana  | string      | null: false, foreign_key: true|
| date_of_birth    | integer     | null: false, foreign_key: true|

## Association


- has_many :products_information
- has_one :purchases_record




##products_information

| Column            | Type        |Option                         |
|-------------------|-------------|-------------------------------|
| name              | string      | null: false,                  |
| price             | integer     | null: false,                  |
| explanation       | text        | null: false,                  |
| category          | string      | null: false,                  |
| product_condition | text        | null: false,                  |
| delivery_charge   | integer     | null: false,                  |
| area_of_origin    | string      | null: false,                  |
| days_to_ship      | integer     | null: false,                  |
| users_information | references  | null: false, foreign_key: true|
 
## Association

- belongs_to :user_information
- has_one :purchases_record


##purchases_record

| Column           | Type        |Option                         |
|------------------|-------------|-------------------------------|
| purchases_record | text        | null: false, foreign_key: true|
| seller           | string      | null: false, foreign_key: true|

## Association

- belongs_to :user_information
- has_one :shipping_information


##shipping_information

| Column           | Type        |Option                         |
|------------------|-------------|-------------------------------|
| postal_code      | integer     | null: false, foreign_key: true|
| prefecture       | string      | null: false, foreign_key: true|
| municipalities   | string      | null: false, foreign_key: true|
| house_number     | integer     | null: false, foreign_key: true|
| building_name    | string      | null: false, foreign_key: true|
| phone_number     | integer     | null: false, foreign_key: true|
| purchases_record | references  | null: false, foreign_key: true|

## Association

- belongs_to :purchase_information
- belongs_to :products_information