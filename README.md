


##user_information

| Column           | Type        |Option                         |
|------------------|-------------|-------------------------------|
| name             | references  | null: false, foreign_key: true|
| text             | references  | null: false, foreign_key: true|
| image            | references  | null: false, foreign_key: true|
| items on display | references  | null: false, foreign_key: true|

## Association


- has_many :product
- has_many :purchase
- has_many :shipping



##product_information

| Column           | Type        |Option                         |
|------------------|-------------|-------------------------------|
| name             | references  | null: false, foreign_key: true|
| price            | references  | null: false, foreign_key: true|
| image            | references  | null: false, foreign_key: true|
| question         | references  | null: false, foreign_key: true|
| explanation      | references  | null: false, foreign_key: true|

## Association

- belongs_record :user
- has_one :purchase


##purchase_record

| Column           | Type        |Option                         |
|------------------|-------------|-------------------------------|
| past orders      | references  | null: false, foreign_key: true|
| seller           | references  | null: false, foreign_key: true|

## Association

- belongs_to :user
- belongs_to :product


##shipping_information

| Column           | Type        |Option                         |
|------------------|-------------|-------------------------------|
| address          | references  | null: false, foreign_key: true|
| name             | references  | null: false, foreign_key: true|
| phone number     | references  | null: false, foreign_key: true|
| shipping method  | references  | null: false, foreign_key: true|

## Association

- belongs_to :purchase
- belongs_to :information