class PeopleController < ApplicationController

  def index
    @people = Person.all
  end

  def show
    id = params[:id]
    @person = Person.find(id)
  end

  def leaderboard
    @champions = Person.rank1
    @advocates = Person.rank2
    @associates = Person.rank3
  end

  def new
  end

  def create
  end

  def edit
    id = params[:id]
    @person = Person.find(id)
    @roles = [["Student", "Student"], ["Faculty", "Faculty"], ["Staff", "Staff"]]
  end

  def update
    id = params[:id]
    @person = Person.find(id)

    @person.update create_update_params
    if @person.save
      flash[:notice] = "#{@person.first_name} #{@person.last_name} has been updated"
      redirect_to person_path @person
    else
      flash[:error] = "Error updating user"
      redirect_to edit_person_path(@person)
    end
  end

  def destroy
  end

  def my_meetings
    if session[:user_id] == nil
      flash[:notice] = "Sign in to see Your Events"
      redirect_to people_path and return
    end

    person_id = params[:person_id].to_i
    if session[:user_id] == person_id
      @person = Person.find(session[:user_id])
      @meetings = @person.meetings

      @upcoming_meetings = @meetings.where("date >= ?", Date.today)
      @past_meetings = @meetings.where("date < ? ", Date.today)
    else
      @person = Person.find(params[:person_id])
      flash[:alert] = "Permission Denied. Cannot access #{@person.first_name} #{@person.last_name}'s infomation."
      redirect_to people_path and return
    end
  end

  def google_oauth2
    person = Person.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = person.id
    redirect_to root_path
  end

  def failure
    flash[:error]= "Error logging in, please try again."
     if !request.env["omniauth.auth"].nil?
       redirect_to google_oauth2
     end
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end

  private
  def create_update_params
    params.require(:person).permit(:first_name, :last_name, :admin, :image, :role)
  end
end
