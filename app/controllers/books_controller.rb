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
    @books = Book.all

  end
  
  def new
     @books = Book.new
   respond_to do |format|
    format.html
    format.js
   end
  end

  def create
    @books = Book.new(book_params)
    if @books.save
      flash[:notice] = "You have successfully created"
    
      redirect_to libraryl_path
         else
      render :new
    end

  end

  def show
    @books = Book.find(params[:id])
  end

  def edit
    @books = Book.find(params[:id])
  end

  def destroy
    @books = Book.find(params[:id])
    @books.destroy
      respond_to do |format|
        format.html {redirect_to books_path}
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
