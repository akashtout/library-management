class LibrariansController < ApplicationController
  before_action :validates, only: [ :index,:current_user_profile]
  before_action :librarian_validates,  only: [:newlibrarian, :history]
  def index
    @librarian = Librarian.all
  end

  def home
    @librarian = Librarian.all  
  end

  def librarianhome
  end

  def new
    @librarian = Librarian.new
  end

  def newlibrarian
    @newlibrarian = Librarian.new
  end

  def history
    if params[:search_key]
      @history = Borrow.where("librarian_id LIKE ? OR student LIKE ? ", 
      "%#{params[:search_key]}%", "%#{params[:search_key]}%")
    else
      @history=Borrow.where(status:'true')
    end
  end

  def show  
  end

  def create
    librarian = Librarian.new(librarian_params)
    if librarian.save
      flash[:notice]="Acount Create successful"
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

  def current_user_profile
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def validates
    if current_user.present?
    else
      redirect_to librarianhome_path
    end
  end

  def librarian_validates
    if check_librarian.present?
    else
      redirect_to librarianhome_path
    end
  end

  def librarian_params
    params.require(:librarian).permit(:name, :email, :password, :usertype, :search_key)
  end
  
end
