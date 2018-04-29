class RegistrationsController < ApplicationController

  def new
    @meeting = Meeting.find(params[:meeting_id])

    if session[:user_id] != nil
      @person = Person.find(session[:user_id])
    else
      flash[:notice] = "Sign in to register"
      redirect_to meeting_path(@meeting.id) and return
    end
    @registration = Registration.new
  end

  def create
    update_params = create_update_params
    @meeting = Meeting.find(update_params[:meeting_id]);
    @registration = Registration.new(update_params)

    if @registration.save
      flash[:notice] = "Successfully registred for #{@meeting.title}"
      redirect_to meeting_path(@meeting.id) and return
    else
      flash[:error] = "Error adding event"
      redirect_to meeting_path(@meeting.id) and return
    end
  end

  def edit
  end

  def show
  end

  private
  def create_update_params
    params.require(:registration).permit(:person_id, :meeting_id)
  end
end
