


##users_information

| Column           | Type        |Option                         |
|------------------|-------------|-------------------------------|
| name             | references  | null: false, foreign_key: true|
| mail             | references  | null: false, foreign_key: true|
| last_name_zen    | references  | null: false, foreign_key: true|
| first_name_zen   | references  | null: false, foreign_key: true|
| last_name_kana   | references  | null: false, foreign_key: true|
| first_name_kana  | references  | null: false, foreign_key: true|
| date_of_birth    | references  | null: false, foreign_key: true|

## Association


- has_many :products_information
- has_one :purchases_record




##products_information

| Column            | Type        |Option                         |
|-------------------|-------------|-------------------------------|
| name              | references  | null: false, foreign_key: true|
| price             | references  | null: false, foreign_key: true|
| explanation       | references  | null: false, foreign_key: true|
| category          | references  | null: false, foreign_key: true|
| product_condition | references  | null: false, foreign_key: true|
| delivery_charge   | references  | null: false, foreign_key: true|
| area_of_origin    | references  | null: false, foreign_key: true|
| days_to_ship      | references  | null: false, foreign_key: true|
| users_information | references  | null: false, foreign_key: true|
 
## Association

- belongs_to :user_information
- has_one :purchases_record


##purchases_record

| Column           | Type        |Option                         |
|------------------|-------------|-------------------------------|
| purchases_record | references  | null: false, foreign_key: true|
| seller           | references  | null: false, foreign_key: true|

## Association

- belongs_to :user_information
- has_one :shipping_information


##shipping_information

| Column           | Type        |Option                         |
|------------------|-------------|-------------------------------|
| postal_code      | references  | null: false, foreign_key: true|
| prefecture       | references  | null: false, foreign_key: true|
| municipalities   | references  | null: false, foreign_key: true|
| house_number     | references  | null: false, foreign_key: true|
| building_name    | references  | null: false, foreign_key: true|
| phone_number     | references  | null: false, foreign_key: true|
| purchases_record | references  | null: false, foreign_key: true|

## Association

- belongs_to :purchase_information
- belongs_to :products_information