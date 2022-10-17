class CreateLibrarians < ActiveRecord::Migration[6.1]
  def change
    create_table :librarians do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :usertype
      t.timestamps
    end
  end
end
