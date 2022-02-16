class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name           , null: false
      t.integer :item_price          , null: false
      t.integer :item_amount         , null: false
      t.text   :item_info 
      t.references :project            , null: false, foreign_key: true
      t.timestamps
    end
  end
end
