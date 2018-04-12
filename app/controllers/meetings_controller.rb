class MeetingsController < ApplicationController
  def index
    @meetings = Meeting.all
  end

  def show
    id = params[:id]
    @meeting = Meeting.find(id)
  end

  def new
    @meeting = Meeting.new
  end

  def create
    @meeting = Meeting.new(create_update_params)

    if @meeting.save
      flash[:notice] = "New event \'#{@meeting.title}\' created"
      redirect_to meetings_path and return
    else
      flash[:error] = "Error adding event"
      redirect_to new_meeting_path(@meeting) and return
    end
    #render :action => 'new'
  end

  def edit
    id = params[:id]
    @meeting = Meeting.find(id)
  end

  def update
  end

  def destroy
  end

  def about
  end

  private
  def create_update_params
    params.require(:meeting).permit(:title, :location, :location, :description, :points, :image)
  end
end
