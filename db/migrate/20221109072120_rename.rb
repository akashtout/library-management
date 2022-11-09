class Rename < ActiveRecord::Migration[6.1]
  def change
    rename_column :librarians, :password_digest, :password
  end
end
