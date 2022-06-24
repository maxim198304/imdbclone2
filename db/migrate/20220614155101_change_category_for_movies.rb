class ChangeCategoryForMovies < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :category, :integer
  end
end
