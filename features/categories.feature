Feature: Create categories
  As a blog administrator
  In order to keep my well structured
  I want to be able catigories to my blog

  Background:
    Given the blog is set up
    Given the following categories exists:
    | Name       |  
    | Inside     |
    | Outside    | 
    And I am logged into the admin panel

  Scenario: View Categories page
    When I follow "Categories"
    Then I should see "Inside"
    And I should see "Outside"
