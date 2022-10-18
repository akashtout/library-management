class BorrowsController < ApplicationController
  def index
      @borrows = Borrow.all
  end

  def new
     @borrows = Borrow.new
  end

 def create

 	@borrow = Borrow.create(librarian_id: current_librarian.id, book_id: params[:book_id],
 		 student: current_librarian.name, status: false, returndate: "2023-01-30".to_date)
    if @borrow.save
     flash[:notice] = "request sent!"
     redirect_to studentindex_path
     else
    
    end
 end

  def borrowshow
    @borrowshow = Borrow.where(status: "false")
  end

  def showreturnbook
	  @showreturnbook=Borrow.where(status: nil)
  end

  def show
 	 @borrow=Borrow.find(params[:id])
  end

  def accept
    @borrow=Borrow.find(params[:id])
    @borrow.update(status: true)
      flash[:notice] = "accepted book request"
      redirect_to libraryl_path
  end

  def returnbook
    @borrow=Borrow.find(params[:id])
    @borrow.update(status: nil)
      flash[:notice] = "Book Returned"
      redirect_to borrowbook_path
  end

   def update
   end

  def edit
  end

  
  def reject
    @borrow = Borrow.find(params[:id])
    @borrow.destroy
    flash[:notice] = "You have Rejected Request"
     redirect_to borrowshow_path
  end

  def destroy
    @borrow = Borrow.find(params[:id])
    @borrow.destroy
    flash[:notice] = "You have Cancel Request"
     redirect_to requestedbook_path
  end

  private
   def borrow_params
      params.require(:borrow).permit(:librarian_id, :book_id, :student,:returndate,:status)
   end

end



