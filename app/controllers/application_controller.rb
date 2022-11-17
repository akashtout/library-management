class ApplicationController < ActionController::Base
  helper_method :check_student
  helper_method :check_librarian

  private
  
  def check_student
    @check_student  ||= current_librarian.usertype =="student"
  end

  def check_librarian
    @check_librarian  ||= current_librarian.usertype =="librarian"
  end
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :usertype])
  end
end

