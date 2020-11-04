class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :require_user

  # Identifies these as helper methods so they can be used erey wer
  helper_method :current_user, :logged_in?
  # If a session variable is set then it will find that student id based on their id
  # Good way to check if there is a logged in user
  def current_user
    # memoization ||= this means that it will only perform this query if the user does not
    # exist
    @current_user ||= Student.find(session[:student_id]) if session[:student_id]
  end

  def logged_in?
    !!current_user
  end

  # enforces behavior that requires a user
  def require_user
    if !logged_in?
      flash[:notice] = "You must be logged in to perform that action"
      redirect_to login_path
    end
  end

end
