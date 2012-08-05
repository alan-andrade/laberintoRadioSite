Feature: User has an account

  Scenario: As a user
    When  I go to /login
    And   I fill the user_session_email with user@test.com
    And   I fill the user_session_password with mypassword
    And   I click Entrar
    Then  I go to /mi_cuenta
