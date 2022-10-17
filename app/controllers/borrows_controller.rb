class BorrowsController < ApplicationController
  def index
      @borrows = Borrow.all
  end

  def new
     @borrows = Borrow.new
  end

 def create

 	@borrow=Borrow.create(librarian_id:current_librarian.id,book_id:params[:book_id],status:false,usertype:"librarian")
    if @borrow.save
     flash[:notice] = "request sent!"
     redirect_to studentindex_path
     else
    
    end
 end

  def borrowshow
    @borrowshow = Borrow.where(status: "false")
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

   def update
   end

  def edit
  end

  def destroy
  end

  private
   def borrow_params
      params.require(:borrow).permit(:librarian_id, :book_id, :status)
   end

end


