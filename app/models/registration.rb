class Registration < ApplicationRecord
  belongs_to :person
  belongs_to :meeting
end
