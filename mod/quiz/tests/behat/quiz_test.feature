# mod : moodle plugin
# quiz :c'est le nom du plugin
@mod @mod_quiz

#Déclaration de fonctionnalités

Feature: Preview a quizz as a student   	#Description
  In order to verify my quiz are ready 		#L'intéret de fonctionnalité
  As a student1 							#Qui en bénéfice
  I need to be able to preview it 			#Que fait cette fonctionnalité

  #La situation initiale

  Background:
   Given the following "users" exist: 		
      | username | firstname | lastname | email                |
      | student1 | amine 	 | Trabelsi | tr.medamine@gmail.com|
    And the following "courses" exist:
      | fullname | shortname | category |
      | Course 1 | C1        | 0        |
    And the following "course enrolments" exist:
      | user     | course | role    |
      | student1 | C1     | student |
    And the following "question categories" exist:
      | contextlevel | reference | name           |
      | Course       | C1        | Test questions |
    And the following "activities" exist:
      | activity   | name   | intro              | course | idnumber |
      | quiz       | Quiz 1 | Quiz 1 description | C1     | quiz1    |
    And the following "questions" exist:
      | questioncategory | qtype       | name  | questiontext    |
      | Test questions   | truefalse   | TF1   | First question  |
      | Test questions   | truefalse   | TF2   | Second question |
    And quiz "Quiz 1" contains the following questions:
      | question | page | maxmark |
      | TF1      | 1    |         |
      | TF2      | 1    | 3.0     |
    And user "student1" has attempted "Quiz 1" with responses:
      | slot | response |
      |   1  | True     |
      |   2  | False    |

   @javascript
  Scenario: Preview a quiz 			#Description d'un comportement attendu
    When I am on the "Quiz 1" "mod_quiz > View" page logged in as "student1"
    And I follow "Review"
    Then I should see "25.00 out of 100.00"
    And I follow "Finish review"
   


