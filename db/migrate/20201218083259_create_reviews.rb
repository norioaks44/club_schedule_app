class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.references  :event_match,    null: false, foreign_key: true 
      t.integer     :match_genre_id, null: false
      t.string      :opponent_team,  null:false
      t.text        :comment,        null: false
      t.text        :match_url

      t.timestamps
    end
  end
end
