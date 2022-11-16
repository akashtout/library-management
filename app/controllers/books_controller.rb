class BooksController < ApplicationController
  before_action :librarian_validates, only: [  :trashbin, :recover, :new, :create, :edit, :destroy, :update, :index, :insert_data, :create_book, :csv_download]
  before_action :student_validates, only: [:studentindex]
  
  def insert_data
    @book = Book.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create_book
    # binding.pry
    Book.import(params[:book][:file])
    flash[:notice] = "Books uploaded successfully"
    redirect_to root_page_path
  end

  def csv_download
    respond_to do |format|
      format.csv { send_data Book.to_csv, filename: "books_data-#{Date.today}.csv" }
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
    redirect_to root_page_path 
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
      format.html {redirect_to root_page_path}
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
      redirect_to root_page_path
    end
  end

  def student_validates
    unless check_student.present?
      redirect_to root_page_path
    end
    # if check_student.present?
    # else
    #   redirect_to root_page_path
    # end
  end
  
  def book_params
    params.require(:book).permit(:title, :price, :description, :author_id, :author_name, :librarian_id, :search_key)
  end

end
