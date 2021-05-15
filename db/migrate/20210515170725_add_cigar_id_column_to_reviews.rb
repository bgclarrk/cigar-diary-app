class AddCigarIdColumnToReviews < ActiveRecord::Migration[6.1]

  def change
    add_column :reviews, :cigar_id, :integer
  end

end
