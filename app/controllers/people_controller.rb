class PeopleController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def about
  end

  def google_oauth2
    person = Person.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = person.id
    redirect_to root_path
  end

  def failure
    flash[:error]= "Error logging in, please try again."
    print request.env["omniauth.auth"]
    redirect_to root_path
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end
end
