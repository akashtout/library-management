class Librarian < ApplicationRecord
 has_secure_password
 has_many :books
 has_many :borrows
 validates :name,:email,:password_digest,:usertype, presence: true
 validates :email, uniqueness: true
end
