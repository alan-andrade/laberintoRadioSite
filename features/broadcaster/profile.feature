Feature: Broadcaster has a profile

  Our broadcasters have a profile which will serve as
  information source to the complete application.
  i.e. Photos, name, nicknames, social media accounts

  Scenario: As a new Broadcaster
    Given I received the invitataion email
    When I click on the sign up link
    Then I should get redirected to the create an account url
    And  I should be able to give a new password
    Then I should get redirected to my fresh profile
