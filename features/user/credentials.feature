Feature: User has an account

  Scenario: I log in successfully
    Given An existent user
    When  I go to "/login"
    And   I enter my credentials correctly
    Then  I get redirected to "/mi_cuenta"
