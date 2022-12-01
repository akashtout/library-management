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

  def after_sign_in_path_for(resource)
    if check_librarian
      root_page_path
    elsif check_student
      root_page_path
    else
      edit_librarian_registration_path
    end
  end

  def after_sign_up_path_for(resource)
    root_page_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :usertype])
 
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :usertype, :password_confirmation)}

  end
end

