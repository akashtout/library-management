class ApplicationController < ActionController::Base
 helper_method :current_librarian
 helper_method :check_user
 helper_method :current_student
 helper_method :accepted
 helper_method :declined
 helper_method :requestbook
 def accepted
 	@accepted ||=Borrow.update(status: true)
 end

 def declined
 	@declined ||=Borrow.update(status: false)
 end

 def current_librarian
   @current_librarian ||= Librarian.find(session[:librarian_id]) if session[:librarian_id] 
 end

 def check_user
   @check_user  ||= current_librarian.usertype =="Student"
 end

def requestbook
	@requestbook = Borrow.create(librarian_id:current_librarian.id,book_id:1,email: "akash@gmail.com")
end

 end