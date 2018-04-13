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
    id = params[:id]
    # if current_user.id != id.to_i
    #   flash[:notice] = "You cannot edit some one else's profile!"
    #   redirect_to action: "show", id: id
    # end
    @person = Person.find(id)
    @roles = [["Student", "Student"], ["Faculty", "Faculty"], ["Staff", "Staff"]]
  end

  def update
    id = params[:id]
    @person = Person.find(id)

    @person.update create_update_params
    if @person.save
      flash[:notice] = "#{@person.name} has been updated"
      redirect_to person_path @person
    else
      flash[:error] = "Error updating user"
      redirect_to edit_person_path(@person)
    end
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

  private
  def create_update_params
    # TODO add :role to permited. add role to people migration
    params.require(:person).permit(:first_name, :last_name, :admin, :image)
  end
end
