class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string  :title
      t.integer :price
      t.string  :description
      t.integer :author_id
      t.string :author_name
      t.timestamps
    end
  end
end


