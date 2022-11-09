class BorrowsController < ApplicationController
  before_action :student_validates, only: [:destroy, :requestedbook, :borrowbook]
  before_action :validates, only: [:borrowshow, :showreturnbook, :overdue_date_book, :index]
  def index
    @borrow = Borrow.all
  end
  def new
    @borrow = Borrow.new
  end
  def create
    @borrow = Borrow.create(librarian_id: current_user.id, book_id: params[:book_id],
    student: current_user.name, status: false, returndate: "2022-11-08".to_date)
    if @borrow.save
      respond_to do |format|
        format.html 
        format.js 
      end
    end
  end
  def show
    @borrow = Borrow.find(params[:id])
  end
  def overdue_date_book
    @overdue_date_book=Borrow.where("returndate <= :date", date: Date.today).where(status: true)
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
  def update
  end
  def accept
    @borrow = Borrow.find(params[:id])
    @borrow.update(status: true)
    respond_to do |format|
      format.html {redirect_to borrowshow_path}
      format.js  {redirect_to borrowshow_path}
    end
  end
  def reject
    @borrow = Borrow.find(params[:id])
    @borrow.destroy
    respond_to do |format|
      format.js
    end
  end
  def returnbook
    @borrow = Borrow.find(params[:id])
    @borrow.update(status: nil)
    respond_to do |format|
      format.html {redirect_to borrowbook_path}
      format.js  {redirect_to borrowbook_path}
    end
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
  private
  def validates
    if check_librarian.present?
    else
      redirect_to librarianhome_path
    end
  end
  def student_validates
    if current_user.present?
    else
      redirect_to librarianhome_path      
    end
  end
  
  def borrow_params
    params.require(:borrow).permit(:librarian_id, :book_id, :student, :returndate, :status)
  end
  
end

