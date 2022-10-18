class LibrariansController < ApplicationController
 def index
   @librarian = Librarian.all
 end

def new
   @librarian = Librarian.new
end

def allstudent
    if params[:search_key]
      @allstudent = Borrow.where("librarian_id LIKE ? OR book_id LIKE ? ", 
      "%#{params[:search_key]}%", "%#{params[:search_key]}%")
    else
       @allstudent=Borrow.where(status:'true')
    end
end

def borrowbook
 @borrowbook=Borrow.where({ student: current_librarian.name, status: "true" })
end

def requestedbook
 @requestedbook=Borrow.where({ student: current_librarian.name, status: "false" })

end

def show  
end

def create
  librarian = Librarian.new(librarian_params)
   if librarian.save
     flash[:notice]="Signup successful"
     redirect_to '/'
   else
     redirect_to '/signup'
   end
end

def libraryl
end

private
   def librarian_params
      params.require(:librarian).permit(:name, :email, :password, :usertype, :search_key)
   end
end
