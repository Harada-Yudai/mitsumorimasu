class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :pro_day           , null: false
      t.string :pro_number        , null: false
      t.string :pro_name          , null: false
      t.text   :pro_info 
      t.references :user          , null: false, foreign_key: true
      t.references :client        , null: false, foreign_key: true
      t.timestamps
    end
  end
end
