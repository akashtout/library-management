class LibrariansController < ApplicationController
  def index
    @librarian = Librarian.all
  end

  def home
    @librarian = Librarian.all  
  end

  def new
    @librarian = Librarian.new
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
      flash[:notice]="Signup successful"
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

  def viewprofile
   respond_to do |format|
       format.html
       format.js
     end
  end

  def libraryindex
  
  end

  private
    def librarian_params
      params.require(:librarian).permit(:name, :email, :password, :usertype,:search_key)
    end
  end
