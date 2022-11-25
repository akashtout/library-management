class Librarian < ApplicationRecord

  def search
    if params[:search].blank?
      redirect_to root_page_path
    else
      @parameter = params[:search]
      @results = Librarian.all.where("email like :search" , search: "%#{@parameter}%")
    end    
  end

  cattr_accessor :current_librarian
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_many :books, dependent: :destroy
  has_many :borrows, dependent: :destroy
  validates :name,:email,:usertype, presence: true
  validates :email, uniqueness: true
end
