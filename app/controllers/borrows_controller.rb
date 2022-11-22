  class BorrowsController < ApplicationController
    before_action :validates, only: [:borrowshow, :showreturnbook, :overdue_date_book, :index]
    before_action :set_borrow , only: [:show, :accept, :destroy, :reject, :returnbook]

    rescue_from CanCan::AccessDenied do |exception|
      render json: {warning: exception, status: "Authorization failed"}
    end

    def index
      @borrow = Borrow.all
    end

    def new
      @borrow = Borrow.new
    end

    def create
      #binding.pry
      if Borrow.where(status: false, book_id: params[:book_id]).present?
        respond_to root_page_path
      else
        @borrow = Borrow.create(librarian_id: current_librarian.id, book_id: params[:book_id],
          student: current_librarian.name, status: false, returndate: "2022-11-08".to_date)
        if @borrow.save
          respond_to do |format|
            format.html 
            format.js 
          end
        end
      end
    end



    def show
    end

    def overdue_date_book
      @overdue_date_book=Borrow.where("returndate <= :date", date: Date.today).where(status: true)
    end

    def requestedbook
      @requestedbook = Borrow.studentrequestbook(current_librarian)
    end

    def borrowbook
      @borrowbook = Borrow.borrowbooks(current_librarian)
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

    def set_borrow
      @borrow = Borrow.find(params[:id])
    end

    def validates
      if check_librarian.present?
      else
        redirect_to root_page_path
      end
    end
    
    def borrow_params
      params.require(:borrow).permit(:librarian_id, :book_id, :student, :returndate, :status)
    end
    
  end