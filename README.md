# READ ME
# アプリケーション名
<img width="454" alt="logo" src="https://user-images.githubusercontent.com/90507746/157046198-6b3bc089-eb2b-48dd-b863-243c8eebab10.png">

# アプリケーション概要
個人 - お客様 間の御見積情報を管理することを想定したアプリケーションです。  
御見積ごとに、見積目的、見積詳細、商品詳細を一括管理できます。
お客様ごとにページを分けて表示することで、打ち合わせをしながら、素早く情報を入力できます。  
また、過去の御見積もすぐに調べることができるので、お客様との打ち合わせがスムーズに進行可能です。  

# URL
https://mitsumorimasu.herokuapp.com/
### Basic認証
ID　　:　admin  
Pass　:　mitsumori
### テストユーザー
アドレス　：　aaa@aaa  
Pass 　　　: 　aaaaaa  


# 利用方法
新規登録、ログイン後、以下のようなマイページが表示されます。  
上部にはユーザー情報、下部にはお客様一覧が表示されます。  
「お客様登録」から、お客様情報を追加できます。　  
お客様名を選択することで、お客様ページに遷移します。
<img width="1428" alt="image" src="https://user-images.githubusercontent.com/90507746/157051986-788a5627-a7ed-444f-8dbc-e12fb8d296f0.png">
お客様ページでは、以下のような画面が表示されます。  
「お客様情報詳細」から、情報を編集できます。  
「新規御見積追加」から、見積を追加できます。  

# 目指した問題解決

# 洗い出した要件

# 実装した機能についての画像やGIFおよびその説明

# 実装予定の機能

# データベース設計

### users テーブル

| Column                     | Type   | Options                   |
| -------------------------- | ------ | ------------------------- |
| email                      | string | null: false, unique: true |
| encrypted_password         | string | null: false               |
| last_name                  | string | null: false               |
| first_name                 | string | null: false               |
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
| cli_first_name             | string      | null: false                     |
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


