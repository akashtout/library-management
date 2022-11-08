class BorrowsController < ApplicationController
  before_action :find_ids, only: [:show, :accept, :reject, :returnbook, :destroy]

  def find_ids
    @borrow = Borrow.find(params[:id])
  end

  def index
    @borrow = Borrow.all
  end

  def new
    @borrow = Borrow.new
  end

  def create
    @borrow = Borrow.create(librarian_id: current_user.id, book_id: params[:book_id],
 		student: current_user.name, status: false, returndate: "2023-01-30".to_date)
    if @borrow.save
      respond_to do |format|
        format.html 
        format.js 
      end
    end
  end

  def show
  end

  def requestedbook
    @requestedbook = Borrow.studentrequestbook(current_user)
  end

  def borrowbook
    @borrowbook = Borrow.borrowbooks(current_user)
  end

  def borrowshow
    @borrowshow = Borrow.showrequestedbook
  end

  def showreturnbook
	  @showreturnbook = Borrow.returnsbook
    respond_to do |format|
      format.html
      format.js
    end
  end

  def return_book
    @return_book=Borrow.where(status: nil)    
  end

  def update
  end

  def accept
    @borrow.update(status: true)
      respond_to do |format|
        format.html {redirect_to borrowshow_path}
        format.js  {redirect_to borrowshow_path}
      end
  end

  def reject
    @borrow.destroy
      respond_to do |format|
        format.js
      end
  end

  def returnbook
    @borrow.update(status: nil)
    respond_to do |format|
      format.html {redirect_to borrowbook_path}
      format.js  {redirect_to borrowbook_path}
    end
  end


  def edit
  end

  def destroy
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



