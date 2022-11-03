class BooksController < ApplicationController
  before_action :find_ides, only: [ :edit, :update]

  def find_ides
      if check_librarian.present?
        @book = Book.find(params[:id])
    else
       redirect_to home_path
    end
  end

  def index
      if params[:search_key]
        @books = Book.where("title LIKE ? OR author_name LIKE ? ", 
        "%#{params[:search_key]}%", "%#{params[:search_key]}%")
      else
        @books = Book.all
      end
  end

  def studentindex
     @book = Book.all
  end
  
  def home
  end

  def new
     @book = Book.new
     respond_to do |format|
       format.html
       format.js
     end
  end

  def create
     @book = Book.new(book_params)
     if @book.save
       flash[:notice] = "You have successfully created"
       redirect_to home_path
     else
       render :new
     end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
  end

  def destroy
    @book = current_user.books.find(params[:id])
    @book.destroy
    respond_to do |format|
      format.html {redirect_to home_path}
      format.js
    end
  end

  def update
     if @book.update(book_params)
       redirect_to @book
     else
       render :edit
     end
  end

  private
    def book_params
      params.require(:book).permit(:title, :price, :description, :author_id, :author_name, :librarian_id, :search_key)
    end
  end
