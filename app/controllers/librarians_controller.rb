class LibrariansController < ApplicationController
  before_action :authenticate_librarian!
  before_action :set_librarian , only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  rescue_from CanCan::AccessDenied do |exception|
    render json: {warning: exception, status: "Authorization failed"}
  end

  def index
    @librarian = Librarian.all
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
  end

  def destroy
    @librarian.destroy
    redirect_to root_page_path
  end

  def show
  end

  def create
    librarian = Librarian.new(librarian_params)
    if librarian.save
      flash[:notice]="Account Create successful"
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
    if @librarian.update(librarian_params)
      redirect_to root_page_path
    else
      render :edit
    end
  end

  private

  def set_librarian
    @librarian = Librarian.find(params[:id])    
  end

  def librarian_params
    params.require(:librarian).permit(:name, :email, :password, :usertype, :search_key)
  end

end
