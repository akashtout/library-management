class SessionsController < ApplicationController
  def new
    @librarian = Librarian.new
  end
  
  def create
     librarian = Librarian.find_by_email(params[:email])
     if librarian && librarian.authenticate(params[:password])
       session[:librarian_id] = librarian.id
       flash[:notice]="Login successful"
       redirect_to home_path
     else
       flash[:notice]="Invalid Email or Password"
       redirect_to '/login'
     end
  end

  def destroy
    session[:librarian_id] = nil
    redirect_to '/'
  end
end 



      