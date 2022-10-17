class LibrariansController < ApplicationController
def index
   @librarians = Librarian.all
end

def new
   @librarian = Librarian.new
end

def allstudent
   @allstudent=Borrow.where(status:'true')
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
      params.require(:librarian).permit(:name, :email, :password, :usertype)
   end
end
