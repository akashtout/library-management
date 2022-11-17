class Removecolumn < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :librarian_id, :integer
   
  end
end
