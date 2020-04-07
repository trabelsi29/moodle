@core @core_question
Feature: A teacher can create a question matrix
  In order to prepare question
  As a teacher
  I need to create course and prepare question

  Background:
    Given the following "users" exist:
      | username | firstname | lastname | email                |
      | teacher1 | Teacher   | 1        | teacher1@unige.ch    |
      | student1 | Student   | 2        | student@etu.unige.ch |
    And the following "courses" exist:
      | fullname | shortname | format |
      | Course 1 | C1        | weeks  |
    And the following "course enrolments" exist:
      | user     | course | role           |
      | teacher1 | C1     | editingteacher |
    And the following "question categories" exist:
      | contextlevel | reference | name           |
      | Course       | C1        | Test questions |
    And the following "questions" exist:
      | questioncategory | qtype     | name              | user     | questiontext    |
      | Test questions   | essay     | A question 1 name | admin    | Question 1 text |
      | Test questions   | essay     | B question 2 name | teacher1 | Question 2 text |
      | Test questions   | numerical | C question 3 name | teacher1 | Question 3 text |
    And I log in as "teacher1"
    And I am on "Course 1" course homepage
    And I turn editing mode on  

    @javascript
    Scenario : Test quiz as a teacher
    When I am on "Course 1" course homepage
    And I turn editing mode on
    And I follow "Add an activity or resource" in the "Topic 1" "section"
    And I set the field "Quiz" to "1"
    And I press "Add"
    And I should see "Adding a new Quiz to Topic 1"
    And I fill the form with:
      | Name       | Quiz1       |
      | Description| Test Quiz 1 |
    And I click on "Save and display"
    Then I shouled see "No questions have been added yet"

    @javascript
    Scenario : Test quiz as a student
    Given I log in as "student1"
    And I log out
    And I log in as "student1"
    And I follow "Course 1"
    And I follow "Quiz1"
    And I press "Attempt quiz now"
    Then I should see "Question 1"
    And I should see "Vous devez répondre à la question 1"
    
 
    
