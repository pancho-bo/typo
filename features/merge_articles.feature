Feature: Merge Articles
  As a blog administrator
  In order to my blog simple
  I want to be able to merge aricles in my blog

  Background:
    Given the blog is set up
    Given the following articles exists:
    | Author | Title       | Body | 
    | Alice  | Impressions | A good one |
    | Bob    | Feelings    | A deep one | 
    And I am logged into the admin panel

  Scenario: Successfully merge articles
    When I merge article "Impressions" with article "Feelings"
    Then there should not be article "Impressions"
    And author of article "Feelings" should be "Bob"
    And title of article "Feelings" should be "Feelings"
    And body of article "Feelings" should contain "A good one"
    And body of article "Feelings" should contain "A deep one"

  Scenario: Comments should inherit
    Given "Impressions" article have 2 comments
    And "Feelings" article have 2 comments
    When I merge article "Impressions" with article "Feelings"
    Then "Feelings" article should have 4 comments
