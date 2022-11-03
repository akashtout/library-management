class Librarian < ApplicationRecord
  has_secure_password
  has_many :books, dependent: :destroy
  has_many :borrows, dependent: :destroy
  validates :name,:email,:password_digest,:usertype, presence: true
  validates :email, uniqueness: true
end
