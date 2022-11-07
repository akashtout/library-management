class A < ActiveRecord::Migration[6.1]
  def change


remove_column :librarians, :remember_created_a
remove_column :librarians, :confirmation_token
remove_column :librarians, :unconfirmed_email
remove_column :librarians, :confirmed_at
remove_column :librarians, :confirmation_sent_at
remove_column :librarians, :sign_in_count
remove_column :librarians, :current_sign_in_at
remove_column :librarians, :last_sign_in_at
remove_column :librarians, :current_sign_in_ip
remove_column :librarians, :last_sign_in_ip
remove_column :librarians, :failed_attempts
remove_column :librarians, :unlock_token
remove_column :librarians, :locked_at
  end
end
