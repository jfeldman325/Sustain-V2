Feature: Edit an event
    As an admin
    so that I can keep the details of an event up to date
    I want to be able to update event information.

    Background: the website already has some existing events, users and participants
      Given these Events:
            | title           | date_time           | location        | recurring | points | description                     |
            | Class 1         | October 30, 4:30 PM | Persson 108     | yes       | 3      | Recycling Class                 |
            | Non-recurring 1 | November 2, 7:00 PM | Love Auditorium | no        | 1      |Guest Speaker on Global Warming |

      Given these users:
            | name         | classification |
            | John Cane    | Faculty        |
            | Thomas Smith | Student        |

    Scenario: Update the details of a specific event
     Given I am on the events page
     When I follow "Class 1"
     Then I should see "October 30, 2017 04:30 PM"
     And I should see "Persson 108"
     And I should see "Recycling Class"
     When I follow "Edit event details"
     And I fill in "Description" with "Learning about the third R: Recycling"
     And I fill in "Location" with "Ho 101"
     And I press "Update event details"
     Then I should see "Learning about the third R: Recycling"
     And I should see "Ho 101"

   Scenario: Incorrectly update the details of a specific event
    Given I am on the events page
    When I follow "Class 1"
    Then I should see "October 30, 2017 04:30 PM"
    And I should see "Persson 108"
    And I should see "Recycling Class"
    When I follow "Edit event details"
    And I fill in "Description" with ""
    And I press "Update event details"
    Then I should see "Error updating event"

  Scenario: Delete an event
   Given I am on the events page
   When I follow "Class 1"
   Then I should see "October 30, 2017 04:30 PM"
   When I follow "Delete event"
   Then I should be on the events page
   And I should see "Event Class 1 deleted"
