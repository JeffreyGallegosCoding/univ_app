class SessionsController < ApplicationController
  skip_before_action :require_user, only: [:new, :create]

  def new

  end

  def create
    student = Student.find_by(email: params[:sessions][:email].downcase)
    # Be sure to include the first student in order verify that the student object is
    # valid and exists in the database
    if student && student.authenticate(params[:sessions][:password])
      # Set the session variable (what is stored as a cookie in the browser)
      session[:student_id] = student.id
      flash[:notice] = "You have successfully logged in"
      redirect_to student
    else
      # Flash.now stays for only the page that it is on
      flash.now[:notice] = "Something was wrong with your login info"
      render 'new'
    end
  end

  def destroy
    # Sets your previous session to nil
    session[:student_id] = nil
    flash[:notice] = "You have successfully logged out"
    redirect_to root_path
  end

end