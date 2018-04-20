class AddEventsToPeople < ActiveRecord::Migration[5.1]
  def change
    add_reference :people, :event, index: true
    add_foreign_key :people, :events
  end
end
