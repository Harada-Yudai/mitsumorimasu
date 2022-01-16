 テーブル設計

## users テーブル

| Column                     | Type   | Options                   |
| -------------------------- | ------ | ------------------------- |
| email                      | string | null: false, unique: true |
| encrypted_password         | string | null: false               |
| last_name                  | string | null: false               |
| first_name                 | string | null: false               |
| last_kana                  | string | null: false               |
| first_kana                 | string | null: false               |
| company                 b  | string | null: false               |
| address                    | string | null: false               |
| phone                      | string | null: false               |
| info                       | text   | null: false               |

### Association

- has_many :clients
- has_many :projects

## clients テーブル

| Column                     | Type        | Options                         |
| -------------------------- | ----------- | ------------------------------- |
| cli_email                  | string      | null: false, unique: true       |
| cli_company                | string      | null: false                     |
| cli_last_name              | string      | null: false                     |
| cli_first_name             | string      | null: false                     |
| cli_last_kana              | string      | null: false                     |
| cli_first_kana             | string      | null: false                     |
| cli_address                | string      | null: false                     |
| cli_phone                  | string      | null: false                     |
| cli_info                   | text        | null: false                     |
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
| pro_info                   | string      | null: false                     |
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
| gd_info                    | string      | null: false                     |
| project                    | references  | null: false, foreign_key: true  |

### Association

- belongs_to :project