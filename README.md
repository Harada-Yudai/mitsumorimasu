# READ ME
# アプリケーション名
<img width="454" alt="logo" src="https://user-images.githubusercontent.com/90507746/157046198-6b3bc089-eb2b-48dd-b863-243c8eebab10.png">

# アプリケーション概要
個人 - お客様 間の御見積情報を管理できるアプリケーションです。 
ノートPC上でこのアプリケーションを使用しながら、打ち合わせを行う想定で作成しました。  
お客様情報、見積目的、見積詳細、商品詳細を一括管理できます。
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
「プロフィール編集」から、ユーザー情報を変更できます。  
「お客様登録」から、お客様情報を追加できます。　  
お客様名を選択することで、お客様ページに遷移します。
<img width="1428" alt="image" src="https://user-images.githubusercontent.com/90507746/157051986-788a5627-a7ed-444f-8dbc-e12fb8d296f0.png">

クライアントページでは、以下のような画面が表示されます。   
「お客様情報詳細」から、情報を編集できます。  
「新規御見積追加」から、見積を追加できます。  
「御見積編集」から、選択している見積情報を変更できます。  
現在選択している見積が、左側に大きく表示されます。  
過去作成した見積はその右側に表示され、数が多いと横スクロールできます。  
「選択」を押すことで、表示する見積を変更することができます。
[![Image from Gyazo](https://i.gyazo.com/a0bae2fa50ce9c306e85c446511f8eff.gif)](https://gyazo.com/a0bae2fa50ce9c306e85c446511f8eff)

選択されている見積の内容が、下部に表示されます。  
「新規商品追加」から商品を追加できます。  
見積に登録している商品一覧が左側に表示され、選択している商品の詳細がその右に大きく表示されます。  
「商品編集」から選択している商品の情報を変更できます。  
<img width="1414" alt="image" src="https://user-images.githubusercontent.com/90507746/157065187-0f43ad97-c49b-4526-ab5e-a6fb73edb210.png">

左の商品ボタンを選択することで、表示する商品を変更することができます。  
[![Image from Gyazo](https://i.gyazo.com/5a18bac584583af7fb8dea943e2123de.gif)](https://gyazo.com/5a18bac584583af7fb8dea943e2123de)

# 工夫した点
・編集ボタンは緑色、追加ボタンは青色というように、ボタンの色を用途で分類しました  
・一番最初にクライアントページにアクセスした時は、最新の見積、商品を選択させるようにしました  
・選択されている見積は、右の見積一覧に表示されないようにしました
・各種追加ページに、お客様名や見積名を表示するようにしました
・見積や商品を新規登録した際、自動的に選択された状態でクライアントページを表示するようにしました
・見積や商品を選択した状態で、編集ページや、追加ページに移動した場合、選択されている情報を引き継ぎ、クライアントページに戻ってきた際に、再選択する必要がないようにしました。  

# 開発環境

# 実装予定の機能
・非同期通信を用いた画面遷移  
・見積書印刷(pdf化)機能  
・商品画像登録機能  
・住所のMAP表示  
・スケジュール管理機能  

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


