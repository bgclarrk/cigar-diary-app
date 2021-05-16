class AddCigarToReviews < ActiveRecord::Migration[6.1]

  def change
    add_column :reviews, :review_cigar, :string
  end

end
