# READ ME
## アプリケーション名
みつもります

## アプリケーション概要
取引先毎に見積を管理できます

## URL
https://mitsumorimasu.herokuapp.com/
## テスト用アカウント

## 利用方法

## 目指した問題解決

## 洗い出した要件

## 実装した機能についての画像やGIFおよびその説明

## 実装予定の機能

## データベース設計

### users テーブル

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

### clients テーブル

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

### projects テーブル

| Column                     | Type        | Options                         |
| -------------------------- | ----------- | ------------------------------- |
| pro_day                    | string      | null: false                     |
| pro_number                 | string      | null: false                     |
| pro_name                   | string      | null: false                     |
| pro_info                   | text        |                                 |
| user                       | references  | null: false, foreign_key: true  |
| client                     | references  | null: false, foreign_key: true  |

### Association

- has_many :items
- belongs_to :user
- belongs_to :client

### items テーブル

| Column                       | Type        | Options                         |
| ---------------------------- | ----------- | ------------------------------- |
| item_name                    | string      | null: false                     |
| item_price                   | integer     | null: false                     |
| item_amount                  | integer     | null: false                     |
| item_info                    | text        |                                 |
| project                      | references  | null: false, foreign_key: true  |

### Association

- belongs_to :project

## ローカルでの動作方法


