class BooksController < ApplicationController
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
  
  def modal
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
        redirect_to libraryindex_path
     else
        render :new
     end
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
        format.html {redirect_to libraryindex_path}
        format.js
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
      params.require(:book).permit(:title, :price, :description, :author_id, :author_name,:search_key)
    end
  end
