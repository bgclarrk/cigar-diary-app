class CreateReviews < ActiveRecord::Migration[6.1]

  def change
    create_table :reviews do |t|
      t.string :review_title
      t.string :review_rating
      t.string :review_description
      t.string :user_id
      t.timestamps null: false
    end
  end

end
