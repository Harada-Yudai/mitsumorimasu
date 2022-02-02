class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :cli_email 
      t.string :cli_company  
      t.string :cli_last_name     , null: false
      t.string :cli_first_name    , null: false
      t.string :cli_last_kana  
      t.string :cli_first_kana    
      t.string :cli_address  
      t.string :cli_phone_num     , null: false
      t.text   :cli_info 
      t.references :user          , null: false, foreign_key: true
      t.timestamps
    end
  end
end
