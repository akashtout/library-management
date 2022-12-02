class Addf < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :books, :categories, column: :category_id
  end
end
