class AddReturndateToBorrows < ActiveRecord::Migration[6.1]
  def change
   add_column :borrows, :returndate, :date

     end
end
