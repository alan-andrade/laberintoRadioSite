Feature: A user has a profile

  Scenario: I can see my profile data
    Given Im logged in
    And I go to '/mi_cuenta'
    Then I see my profile data
