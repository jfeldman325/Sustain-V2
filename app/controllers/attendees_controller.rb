class AttendeesController < ApplicationController
  #before_action :has_occurrence,:authenticate_user!

  protected
  def has_occurrence
      unless (@occurrence = Occurrence.where("id =?", params[:occurrence_id]).first)
          flash[:error] = "Occurrence must exist to have attendees"
          redirect_to occurrences_path
      end
  end

  public
  def show
    @event = @occurrence.event
   # @attendee = params[:attendee]
    @attendee = Attendee.where("id = ?", params[:attendee_id]).first
  end

  def new
   @attendee = Attendee.new
  end

  def create
    @attendee = @occurrence.attendees.build(create_update_params)
    @attendee.user_id = current_user.id
    if @attendee.save
        flash[:notice] = "Summary created for \'#{@occurrence.event.title}\'"
        redirect_to user_path(current_user)
    else
        flash[:error] = "Failed to create summary for \'#{@occurrence.event.title}\'"
        redirect_to user_path(current_user) and return
    end
    @attendee.user.update_attribute(:tpoints,@attendee.user.tpoints+@occurrence.event.points)
  end

  def edit
    #byebug
     @event = @occurrence.event
     @attendee = Attendee.where("id = ?", params[:attendee_id]).first
  end

  def update
    #byebug
    @attendee = Attendee.where("id = ?", params[:id]).first
    if @attendee.update(create_update_params)
        flash[:notice] = "Summary successfully edited for \'#{@occurrence.event.title}\'"
        redirect_to user_path(current_user)
    else
        flash[:error] = "Failed to edit summary for \'#{@occurrence.event.title}\'"
        #redirect_to edit_occurrence_attendee_path(@occurrence,@attendee,:id => @attendee.id)
        redirect_to user_path(current_user)
    end
  end

  def index
    @attendees = @occurence.attendees
    if @attendees.empty?
        flash[:notice] = "There are no users that attended #{@occurrence.event.title}"
        redirect_to event_path(@occurrence.event)
    end
  end


  private
  def create_update_params
    params.require(:attendee).permit(:summary,:attendee_id)
  end

end
