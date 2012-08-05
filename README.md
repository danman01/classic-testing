Meetup 1 (8/5/2012)

**Agenda**

6:30 - 6:45 show up and general chit chat

6:45 - 7:15 introduction to testing, why you need to be doing it, briefly touch on some tools that rails offers you to help with your testing

7:15 -8:00 break up in pairs to start a programming problem from scratch, implementing an agreed upon toolset for testing, and trying to do test driven development

8:00 - 8:15 ask what problems people encountered, see if the group can solve them

8:15 - 8:30 talk about the format of the meetings, ideas people have, get feedback

**Introduction**

Rails official guide entry on testing (read ths if you haven't: http://guides.rubyonrails.org/testing.html)

My intro:

The goal of testing is to be able to write code and know for sure that all the changes and additions you made aren't breaking the rest of your program. The first method for doing this that most people do is make a change, then load up the program and test everything else that they imagine it could have interfered with. This is known as manual testing but it is bad.

The problem is that manual testing just doesn't scale.  When you reach the point where you've amassed enough features that you don't test each one every time you make a change, you start to simply skip testing.  This leads to things breaking and unhappy clients and users.

The cool thing with a framework like rails is that tests are baked in right from the start! But no one is forcing you to write tests for each piece of code, and sometimes they don't get written at all.  

If you make a new rails app (I'm using rails 3.2.3 and ruby 1.9.3), you will have a new directory, test, with a few folders to get you started. These folders are generated when create the app and are populated when you use, for example, 'rails generate scaffold Person' or 'rails g model Ship'

Within the test directory you will have:

fixtures: setup reusable objects to test with (alternate tool: FactoryGirl gem: https://github.com/thoughtbot/factory_girl/blob/master/GETTING_STARTED.md)

functional: tests controller actions

integration: flows through one or more controllers

test_helper.rb: place any code to help tests run

unit: tests models 

Alternate framework: rspec (https://github.com/rspec/rspec-rails/)

Testing serves a few different purposes: making sure your new code won't break old code, documentation for the code you write (many times tests will read like plain english), and they tremendously help other people who inheret your code after you are gone.

**A database just for tests**

Your test database will by default be a sqlite3 database that you need to set up before you start writing tests.  To copy the schema from your dev environment to the test db, run 'rake db:test:prepare' 

To run a single test run 'ruby -I test test/unit/person_test.rb'

There's a shortcut to do all this in a single step: 'rake test:units'.  This will prepare your database and run all your unit tests.

The first thing to do when writing a test is figure out what to test.  Let's say you have a validation in your model that checks to see if a name attribute is unique: 'validates_uniqueness_of :name'.  Now you need to know how to write the test.  Using the built in test framework, you can write something called an assertion, which is simply a method that tells the framework what we expect to be true.  If what you assert to be true is true, nothing will happen.  If it is false, the framework will output a message and tell you where it failed.

Refer to the rails guide for specific commands and more on getting started: http://guides.rubyonrails.org/testing.html

**Test driven develoopement**

This method of development is being used and evangalized throughout the world and supposedly is the best way to write code these days.  The premise is simple, but it takes a while to ingrain this method into your habits.  To do test driven develoment, first write a failing test for the piece of functionality that you desire, like asserting that a name is unique for a new person that you save.  Then, run the test, watch it fail (because you haven't actually written the code yet), and move into your actual model to write the code that makes the test pass.

The challenge for today is to choose a test framework (likely the built in test suite or the popular rspec), and using test driven development, solve the following problem implementing a golf program for an aspiring caddy.

You can use rails or just plain ruby.  The important thing is to do test driven developement and write tests that describe the problem you are trying to solve.

**Problem**
Game of golf - why so confusing? hint - it doesn't have to be!

The game of golf is mysterious in many ways. First, it is hard to understand what is so nice about hitting a ball over 200 yards, and then go looking for it. Second, it is difficult to see how people who have all the time in the world to carefully count the number of strokes they make, seem to be able to forget some of them, as is shown by the low scores turned in at the end of the round by many club players. Third, instead of counting in numbers, they use terms like 'par', 'birdie' (1 below par) and 'bogey' (1 over par), and in rare cases 'hole-in-one', 'eagle' (2 below par), 'double eagle' (3 below par) and 'double bogey' (2 over par). Although it is possible to get worse than a double bogey, and they have names for those too, we'll just assume that most people when getting more than a double bogey will forget the extra strokes and write down 'double bogey'.

You are an aspiring caddy, and want to make sure you know the terms for each score that your golf boss, Jim, hits.  Your program will read in a list of par values for the holes and the associated number of strokes that Jim took.  Your program will tell you what the score is called (and on the way forget any strokes worse than a double-bogey).  Also make sure a hole in one is named that and nothing else. Also output the total score that Jim thinks he hit for the entire game. 

Example input hash (you could also read in a file): {4=>5,5=>3,3=>6,4=>1,5=>5,3=>4,6=>8,3=>7,4=>2}

Example output hash: {1=>'bogey',2=>'eagle',3=>'double bogey',4=>'hole in one', etc}
total = 41

problem taken from:
http://www.karrels.org/Ed/ACM/weur94p/prob_c.html
