class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :category_id, :integer
    create_table :categories do |t|
      t.string :name
      t.timestamps
    end
  end
end
