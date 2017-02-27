# Advertisement Management

###*QA Assignment*

Following are automation tests for the given user stories.
 * Write using Gherkin scenarios.
 * Use BrowserStack to execute tests.

In this release, following user stories are covered:
 * As a user, when I'm on the list view, I want to able to create new advertisements.
 * As a user, when I'm on the list view, I would like to click on an entry in the list to edit it.
 * As a user, when I'm on the advertisement form view, I must provide a price with a proper format.
 * As a user, when I'm on the advertisement form view, I must have a name.
 * As a user, when I'm on the advertisement form view, the save button is not active as long the form is not valid.
 * As a user, after I create a new advertisement, I should see the created entry in the list.
 * As a user, after I update an advertisement, I should see the updated entry in the list.
 * As a user, when I'm on the list view and some one creates or updates an entry, I should receive proper information over WebSockets and see the live changes on my list.
 * As a user, when I'm on the list view, I can sort the list entries by name, in ascending and descending order.

Known issues:
 Trying manually, those two functions doesn't work.
  * As a user, when I create or edit an advertisement, I can press enter to submit the form.
  * As a user, when I create or edit an advertisement, I can press close the form by pressing escape.

This automation task uses Watir Webdriver (Selenium) and follows Page Object pattern.

We could add more TCs by adding related TCs to *.feature files. 
For instance, you have 10 TCs related to Advertisements Management feature, just simply add them to Advertisements Management.feature file.

For debug purpose, this quite easy to do so, you can either 

. *Adding this line to anywhere you want to debug*
```ruby
binding.pry
```

. *If using any IDE, such as RubyMine, putting an breakpoint and executing as debug mode*

###*Project Layout*

* config/config.yml : Data set
* features/*.feature : cucumber features
* features/step_definitions/steps.rb : generic steps that apply to all features
* features/support/helper/*.rb : containing helpers
* features/support/models/*.rb : where putting the models
* features/support/env.rb : configures gems to use, loads the Fixtures instance
* features/support/hooks.rb : initializes scenarios, tears down scenarios
* features/support/pages : the pages which are related to automation tests
* failuretracker: stores the info (screenshot/html file) when any TC is failed

###*Prerequisites*

* Ruby http://www.ruby-lang.org/en/downloads/
* Ruby Gems http://rubygems.org/
* Bundler: 
```ruby
gem install bundler rake
```

###*Configuration*
```ruby
bundle install
```
###*Running Features*

To run a specific feature, for instance: Advertisements Management.feature, you can either:

. *Using terminal: after navigating to ads_web/ directory*
```
cucumber features/Advertisements\ Management.feature
```

. *Using IDE such as RubyMine, click on search.feature file and choose "Run Advertisements Management.feature" on the context menu*

###*Executor selection*
By default profile, those automation tests are executing on local machine.
If you want to execute those tests using BrowserStack, using the browser_stack profile

. *Using terminal: after navigating to ads_web/ directory*
```
cucumber features/Advertisements\ Management.feature -p browser_stack
```