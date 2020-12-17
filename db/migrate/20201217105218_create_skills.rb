class CreateSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :skills do |t|
      t.string :drill_name,    null: false
      t.text :info,            null: false
      t.integer :category_id,  null: false
      t.timestamps
    end
  end
end
