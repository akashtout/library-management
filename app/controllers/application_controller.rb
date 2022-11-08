class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :check_user
  helper_method :check_librarian

  def current_user
    @current_user ||= Librarian.find(session[:librarian_id]) if session[:librarian_id] 
  end

  def check_user
    @check_user  ||= current_user.usertype =="Student"
  end

  def check_librarian
    @check_librarian  ||= current_user.usertype =="librarian"
  end
  
end