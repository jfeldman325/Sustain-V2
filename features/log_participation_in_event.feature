Feature: Logging Participation in an Event
    As a user of the website
    so that I can claim points for attending events in the passport program
    I want to be able to submit a summary of an event to prove I attended and claim my points

    Background: the website already has some exisiting events and users
        Given these Events:
            |id|title|location|recurring|points|description|
            |1 |Class 1| Persson 108|yes|3|Recycling Class|
            |2 |Non-recurring 1| Love Auditorium|no|1|Guest Speaker on Global Warming|

        Given these Occurrences:
            |id|event_id|date_time               |
            |1|1       |October 30, 2018 4:30 PM|
            |2|2       |November 2, 2018 7:00 PM|

        Given these users:
           |id |name       | classification |
           |1 |John Cane  | Faculty        |
           |2 |Thomas Smith|Student        |

        Given these registrees:
            |user_id|event_id |
            |1      |2        |

        Given these attendees:
            |user_id|occurrence_id|summary|
            |2      |2            |whats good|

    Scenario: Submiting a Summary for an event
        Given I am signed in with provider Google
        Given I am on the home page
        When I click on my name
        Then I should see my profile
        When I follow "Submit Event Summary"
        Then I should see "Add an Event Summary for Non-recurring 1"
        When I fill in "Summary" with "whats up"
        And I press "Submit this summary"
