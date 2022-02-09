 テーブル設計

## users テーブル

| Column                     | Type   | Options                   |
| -------------------------- | ------ | ------------------------- |
| email                      | string | null: false, unique: true |
| encrypted_password         | string | null: false               |
| last_name                  | string | null: false               |
| first_name                 | string | null: false               |
| last_kana                  | string |                           |
| first_kana                 | string |                           |
| company                    | string |                           |
| address                    | string |                           |
| phone_num                  | string | null: false               |
| info                       | text   |                           |

### Association

- has_many :clients
- has_many :projects

## clients テーブル

| Column                     | Type        | Options                         |
| -------------------------- | ----------- | ------------------------------- |
| cli_email                  | string      |                                 |
| cli_company                | string      |                                 |
| cli_last_name              | string      | null: false                     |
| cli_last_name              | string      | null: false                     |
| cli_last_kana              | string      |                                 |
| cli_first_kana             | string      |                                 |
| cli_address                | string      |                                 |
| cli_phone_num              | string      | null: false                     |
| cli_info                   | text        |                                 |
| user                       | references  | null: false, foreign_key: true  |

### Association

- has_many :projects
- belongs_to :user

## projects テーブル

| Column                     | Type        | Options                         |
| -------------------------- | ----------- | ------------------------------- |
| pro_day                    | string      | null: false                     |
| pro_number                 | string      | null: false                     |
| pro_name                   | string      | null: false                     |
| pro_info                   | string      |                                 |
| user                       | references  | null: false, foreign_key: true  |
| client                     | references  | null: false, foreign_key: true  |

### Association

- has_many :goods
- belongs_to :user
- belongs_to :client

## goods テーブル

| Column                     | Type        | Options                         |
| -------------------------- | ----------- | ------------------------------- |
| gd_name                    | string      | null: false                     |
| gd_price                   | string      | null: false                     |
| gd_amount                  | string      | null: false                     |
| gd_info                    | string      |                                 |
| project                    | references  | null: false, foreign_key: true  |

### Association

- belongs_to :project