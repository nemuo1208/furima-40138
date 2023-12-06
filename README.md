


##users_information

| Column           | Type        |Option                         |
|------------------|-------------|-------------------------------|
| name             | references  | null: false, foreign_key: true|
| text             | references  | null: false, foreign_key: true|
| image            | references  | null: false, foreign_key: true|
| items_on_display | references  | null: false, foreign_key: true|

## Association


- has_many :products
- has_one :purchases
- has_many :shipping



##products_information

| Column            | Type        |Option                         |
|-------------------|-------------|-------------------------------|
| name              | references  | null: false, foreign_key: true|
| price             | references  | null: false, foreign_key: true|
| question          | references  | null: false, foreign_key: true|
| explanation       | references  | null: false, foreign_key: true|
| text              | references  | null: false, foreign_key: true|
| category          | references  | null: false, foreign_key: true|
| product_condition | references  | null: false, foreign_key: true|
## Association

- belongs_record :user
- has_one :purchases


##purchase_record

| Column           | Type        |Option                         |
|------------------|-------------|-------------------------------|
| past orders      | references  | null: false, foreign_key: true|
| seller           | references  | null: false, foreign_key: true|

## Association

- belongs_to :user
- belongs_to :products


##shipping_information

| Column           | Type        |Option                         |
|------------------|-------------|-------------------------------|
| address          | references  | null: false, foreign_key: true|
| name             | references  | null: false, foreign_key: true|
| phone_number     | references  | null: false, foreign_key: true|
| shipping_method  | references  | null: false, foreign_key: true|
| delivery_charge  | references  | null: false, foreign_key: true|
| area_of_origin   | references  | null: false, foreign_key: true|
| days_to_ship     | references  | null: false, foreign_key: true|
## Association

- belongs_to :purchases
- belongs_to :information