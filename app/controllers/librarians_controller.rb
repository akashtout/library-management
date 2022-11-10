class LibrariansController < ApplicationController
  before_action :validates, only: [ :index, :current_user_profile, :home_page]
  before_action :librarian_validates, only: [:new_librarian, :history]
  before_action :authenticate_librarian!
  
  def index
    @librarian = Librarian.all
  end

  def home_page  
  end

  def root_page
  end

  def new
    @librarian = Librarian.new
  end

  def new_librarian
    @new_librarian = Librarian.new
    if @new_librarian.save
      flash[:notice]="Account Create successful"
      redirect_to root_page_path
    end
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
    if current_librarian.present?
    else
      redirect_to home_page_path
    end
  end

  def librarian_validates
    if check_librarian.present?
    else
      redirect_to home_page_path
    end
  end

  def librarian_params
    params.require(:librarian).permit(:name, :email, :password, :usertype, :search_key)
  end
  
end
