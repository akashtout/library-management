class CreateBorrows < ActiveRecord::Migration[6.1]
  def change
    create_table :borrows do |t|
      t.belongs_to :librarian, foreign_key: true
      t.belongs_to :book, foreign_key: true
      t.boolean :status
      t.string :usertype
      t.timestamps
    end
  end
end
