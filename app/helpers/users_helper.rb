module UsersHelper

    def summary_submitted?(user,occurrence)
        return true
        summary = Attendee.where("user_id = ? AND occurrence_id = ?", user.id, occurrence.event_id).first
        if summary != nil
            true
       # else if summary == nil
        else
            false
        end
    end

end
