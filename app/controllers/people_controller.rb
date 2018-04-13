class PeopleController < ApplicationController
  def index
    @people = Person.all
  end

  def show
    id = params[:id]
    @person = Person.find(id)
    #@signed_in = current_user == nil ? false : current_user.id == @user.id.to_i
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
end
