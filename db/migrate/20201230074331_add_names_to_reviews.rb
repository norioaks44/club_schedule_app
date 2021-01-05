class AddNamesToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :match_date, :date, null: false
    add_column :skills, :skill_url, :string
  end
end
