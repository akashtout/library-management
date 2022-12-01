class Librarian < ApplicationRecord
  cattr_accessor :current_librarian
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable,
  :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_omniauth(access_token)
    data = access_token.info
    librarian = Librarian.where(email: data['email']).first

    unless librarian
      
     librarian = Librarian.create(name: data['name'],
      usertype: "",
      email: data['email'],
      password: Devise.friendly_token[0,20]
      )
   end
   librarian
 end
 has_many :books, dependent: :destroy
 has_many :borrows, dependent: :destroy
 validates :name,:email, presence: true
 validates :email, uniqueness: true
end
