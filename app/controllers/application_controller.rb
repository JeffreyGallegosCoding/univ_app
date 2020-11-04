class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

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

end
