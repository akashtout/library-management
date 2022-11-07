class BooksController < ApplicationController
  before_action :librarian_validates, only: [ :index, :trashbin, :recover, :new, :create, :edit, :destroy, :update]
  before_action :student_validates, only: [:studentindex]
  def index
    if params[:search_key]
      @books = Book.where("title LIKE ? OR author_name LIKE ? ", 
      "%#{params[:search_key]}%", "%#{params[:search_key]}%")
    else
      @books = Book.all
    end
  end

  def studentindex
    borrow_id = Borrow.all.pluck(:book_id)
    @book = Book.where.not(id: borrow_id)
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

  def trashbin
    @book=Book.only_deleted
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book = current_user.books.find(params[:id])
    @book.destroy
    respond_to do |format|
      format.html {redirect_to home_path}
      format.js
    end
  end

  def recover
    if @book=Book.only_deleted.first.recover
      redirect_to trashbin_path
    end 
  end

  def update
    @book = Book.find(params[:id])
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

  def librarian_validates
    if check_librarian.present?
    else
      redirect_to home_path
    end
  end

  def student_validates
    if current_user.present?
    else
      redirect_to home_path
    end
  end
end
