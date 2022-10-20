class LibrariansController < ApplicationController
 def index
   @librarian = Librarian.all
 end

def new
   @librarian = Librarian.new
end

def allstudent
    if params[:search_key]
      @allstudent = Borrow.where("librarian_id LIKE ? OR student LIKE ? ", 
      "%#{params[:search_key]}%", "%#{params[:search_key]}%")
    else
       @allstudent=Borrow.where(status:'true')
    end
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

def viewprofile
   
end

def libraryl
end

private
   def librarian_params
      params.require(:librarian).permit(:name, :email, :password, :usertype,:search_key)
   end
end
