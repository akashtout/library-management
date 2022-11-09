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
  
  def new
    @book = Book.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    params[:book_count].to_i.times do |i|
      @book = Book.new(book_params)
      if @book.save
      end
    end
    flash[:notice]="Book Create successful"
    redirect_to home_page_path 
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
    @book.destroy
    respond_to do |format|
      format.html {redirect_to home_page_path}
      format.js
    end
  end

  def really_destroy
    @book = Book.only_deleted.first.destroy
    redirect_to trashbin_path
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

  def librarian_validates
    if check_librarian.present?
    else
      redirect_to home_page_path
    end
  end

  def student_validates
    if check_user.present?
    else
      redirect_to home_page_path
    end
  end
  
  def book_params
    params.require(:book).permit(:title, :price, :description, :author_id, :author_name, :librarian_id, :search_key)
  end

end
