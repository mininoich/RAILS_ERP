class ApplicationController < ActionController::Base
  protect_from_forgery
  
  
  def admin_signed_in?
    return user_signed_in? && !Admin.find_by_user_id(current_user.id).blank?
  end
  helper_method :admin_signed_in?
  
  def student_signed_in?
    return user_signed_in? && !Student.find_by_user_id(current_user.id).blank?
  end
  helper_method :student_signed_in?
  
  def teacher_signed_in?
    return user_signed_in? && !Teacher.find_by_user_id(current_user.id).blank?
  end
  helper_method :teacher_signed_in?
  
  def authenticate_admin!
    if authenticate_user!
      if !Admin.find_by_user_id(current_user.id).blank?
        return true
      end
    end
    flash[:alert] = "Acces denied"
    redirect_to root_url, :status => 401
  end
  helper_method :authenticate_admin!
  
  def authenticate_student!
    if authenticate_user!
      if !Student.find_by_user_id(current_user.id).blank?
        return true
      end
    end
    flash[:alert] = "Acces denied"
    redirect_to root_url, :status => 401
  end
  helper_method :authenticate_student!
  
  def authenticate_teacher!
    if authenticate_user!
      if !Teacher.find_by_user_id(current_user.id).blank?
        return true
      end
    end
    flash[:alert] = "Acces denied"
    redirect_to root_url, :status => 401
  end
  helper_method :authenticate_teacher!
  
  
end
