Feature: Access to Merge Articles
  As a blog administrator
  In order to keep my blog simple
  I want to be able to merging articles in my blog

  Background:
    Given the blog is set up
    Given the following articles exists:
    | Author | Title      | Body |
    | me     | Impressions | Today I want to make a good one |
    | me     | Feelings   | No feelings for you today | 

  Scenario: Can see merge articles button
    Given I am logged into the admin panel
    And I am on the edit page for "Impressions"
    Then I should see "Article ID"

  Scenario: Non admin can not see merge articles
    Given I am on the edit page for "Impressions"
    Then I should not see "Article ID"
