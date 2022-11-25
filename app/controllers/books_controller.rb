class BooksController < ApplicationController
  before_action :set_book , only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  
  rescue_from CanCan::AccessDenied do |exception|
    render json: {warning: exception, status: "Authorization failed"}
  end

  def insert_data
    @book = Book.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create_book
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
    if params[:search]
      @books = Book.where("title LIKE ? OR author_name LIKE ? ", 
      "%#{params[:search]}%", "%#{params[:search]}%").page(params[:page]).per(10)
    else
      @books=Book.all.page(params[:page]).per(10)
    end
  end

  def studentindex
    borrow_id = Borrow.all.pluck(:book_id)
    @book = Book.where.not(id: borrow_id).page(params[:page])
  end
  
  def new
    @books = Book.new
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
  end

  def edit
  end

  def destroy
    @book.destroy
    respond_to do |format|
      format.html {redirect_to root_page_path}
      format.js
    end
  end

  def really_destroy
    RemoveBook.perform_async  
    redirect_to trashbin_path
  end

  def recover
    if @book=Book.only_deleted.first.recover
      redirect_to trashbin_path
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

  def set_book
    @book = Book.find(params[:id])
  end
  
  def book_params
    params.require(:book).permit(:title, :price, :description, :author_id, :author_name, :librarian_id, :image, :search)
  end
end
