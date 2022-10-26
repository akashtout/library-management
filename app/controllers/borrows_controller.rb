class BorrowsController < ApplicationController
  def index
    @borrow = Borrow.all
  end

  def new
    @borrow = Borrow.new
  end

  def create
 	  @borrow = Borrow.create(librarian_id: current_librarian.id, book_id: params[:book_id],
 		student: current_librarian.name, status: false, returndate: "2023-01-30".to_date)
    if @borrow.save
      respond_to do |format|
        format.html {redirect_to studentindex_path}
        format.js
    end

    else
    end
  end

  def show
 	  @borrow=Borrow.find(params[:id])
  end

  def requestedbook
    @requestedbook=Borrow.where({ student: current_librarian.name, status: "false" })
  end

  def borrowbook
    @borrowbook=Borrow.where({ student: current_librarian.name, status: "true" })
  end


  def borrowshow
    @borrowshow = Borrow.where(status: "false")
  end

  def showreturnbook
	  @showreturnbook=Borrow.where(status: nil)
  end


  def update
  
  end

  def accept
    @borrow=Borrow.find(params[:id])
    @borrow.update(status: true)
      respond_to do |format|
        format.html {redirect_to borrowshow_path}
        format.js
      end
  end

  def returnbook
    @borrow=Borrow.find(params[:id])
    @borrow.update(status: nil)
      flash[:notice] = "Book Returned"
      redirect_to borrowbook_path
  end


  def edit
  
  end

  def destroy
    @borrow = Borrow.find(params[:id])
    @borrow.destroy
      respond_to do |format|
       format.js
      end
  end

  def reject
    @borrow = Borrow.find(params[:id])
    @borrow.destroy
      respond_to do |format|
        format.js
      end
  end

  private
    def borrow_params
      params.require(:borrow).permit(:librarian_id, :book_id, :student, :returndate, :status)
    end

  end



