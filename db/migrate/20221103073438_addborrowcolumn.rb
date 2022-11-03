class Addborrowcolumn < ActiveRecord::Migration[6.1]
  def change
   
    add_foreign_key :borrows, :books, column: :book_id


  
  end
end
