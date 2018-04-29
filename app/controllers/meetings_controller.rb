include WebAdder
class MeetingsController < ApplicationController
  def index
    WebAdder.load_events
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
  end

  def edit
    id = params[:id]
    @meeting = Meeting.find(id)
  end

  def update
    id = params[:id]
    @meeting = Meeting.find(id)

    @meeting.update(create_update_params)
    if @meeting.save
      flash[:notice] = "Event #{@meeting.title} updated"
      redirect_to meetings_path and return
    else
      flash[:error] = "Error updating event"
      redirect_to edit_event_path(@meeting) and return
    end
    #render :action => 'edit'
  end

  def destroy
    @meeting = Meeting.find(params[:id])
    @meeting.destroy
    flash[:notice] = "Event #{@meeting.title} deleted"
    redirect_to meetings_path
  end

  def about
  end

  private
  def create_update_params
    params.require(:meeting).permit(:title, :location, :location, :description, :points, :image)
  end
end
