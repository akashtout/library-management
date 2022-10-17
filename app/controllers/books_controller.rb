class BooksController < ApplicationController
  def studentindex
      @books= Book.all
  end

  def index
     @books = Book.all  
     flash.now[:notice] = "We have exactly #{@books.size} books available."
  end

  def new
     @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "You have successfully created"
      redirect_to books_path
    else
      render :new
    end
  end

  def studentshow
    @book = Book.find(params[:id])
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
      flash[:notice] = "You have successfully Remove"
    redirect_to books_path
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
      params.require(:book).permit(:title, :price,:description,:author_id,:author_name)
    end
  end
