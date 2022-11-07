class Librarian < ApplicationRecord
  has_secure_password
  has_many :books, dependent: :destroy
  has_many :borrows, dependent: :destroy
  validates :name,:email,:usertype, presence: true
  validates :email, uniqueness: true


    validates :password, :presence => true,
                       :length => {:within => 6..10},
                       :on => :create
end
