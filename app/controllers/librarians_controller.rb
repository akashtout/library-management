class LibrariansController < ApplicationController
  before_action :validates, only: [ :index, :current_user_profile]
  before_action :librarian_validates, only: [:new_librarian, :history, :edit, :show, :destroy, :new_user, :index]
  before_action :authenticate_librarian!
  
  def index
    @librarian = Librarian.all
  end

  def new_user
    @librarian = Librarian.where(usertype: 'Nil')    
  end

  def root_page
  end

  def new
    @librarian = Librarian.new
  end

  def new_librarian
    @new_librarian = Librarian.new
    if @new_librarian.save
      redirect_to new_librarian_path
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

  def edit
    @librarian = Librarian.find(params[:id])
  end

 def destroy
    @librarian = Librarian.find(params[:id])
    @librarian.destroy
    redirect_to root_page_path
end

  def show
    @librarian = Librarian.find(params[:id])  
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

  def update
    @librarian = Librarian.find(params[:id])
    if @librarian.update(librarian_params)
      redirect_to root_page_path
    else
      render :edit
    end
  end

  private

  def validates
    if current_librarian.present?
    else
      redirect_to root_page_path
    end
  end

  def librarian_validates
    if check_librarian.present?
    else
      redirect_to root_page_path
    end
  end

  def librarian_params
    params.require(:librarian).permit(:name, :email, :password, :usertype, :search_key)
  end
  
end
