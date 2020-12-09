class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.integer    :title_id,           null: false
      t.string     :info,               null: false
      t.date       :start_time,         null: false, unique: true
      t.integer    :meeting_time_id,    null: false
      t.timestamps
    end
  end
end
