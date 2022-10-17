class ApplicationController < ActionController::Base
 helper_method :current_librarian
 helper_method :check_user
 helper_method :current_student
 helper_method :check_librarian

 def current_librarian
   @current_librarian ||= Librarian.find(session[:librarian_id]) if session[:librarian_id] 
 end

 def check_user
   @check_user  ||= current_librarian.usertype =="Student"
 end

 def check_librarian
   @check_user  ||= current_librarian.usertype =="librarian"
 end


 end