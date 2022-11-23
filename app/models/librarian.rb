class Librarian < ApplicationRecord
  cattr_accessor :current_librarian
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_many :books, dependent: :destroy
  has_many :borrows, dependent: :destroy
  validates :name,:email,:usertype, presence: true
  validates :email, uniqueness: true
end
