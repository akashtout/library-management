class Librarian < ApplicationRecord
  has_secure_password
  has_many :books
  has_many :borrows
  validates :name,:email,:password_digest,:usertype, presence: true
  validates :email, uniqueness: true

def self.search(search)
 if search 
    librarians=Librarian.find_by(name: search)
else
    
end

end
end
