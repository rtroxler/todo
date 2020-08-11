# TODO Application

## Set up any number of individualized projects
![todo_index](https://user-images.githubusercontent.com/2049459/89857851-c7961080-db62-11ea-89ad-c3d7e9590fc6.png)

## Set up subtasks under each project to be completed
![todo_task_list2](https://user-images.githubusercontent.com/2049459/89943886-91997080-dbe4-11ea-98c1-ea672ac3048c.png)

## Dev Requirements

* [Ruby 2.5.5](https://www.ruby-lang.org/en/documentation/installation/): Really anything 2.5+ works, since we need that for Rails 6.
* [SQLite3](https://www.sqlite.org/index.html): Your computer probably already has it. Verify that it's installed with:
```
sqlite3 -v
```
* [Rails](https://www.sqlite.org/index.html): We're using Rails 6 with this project, so a generic gem install should give you what you need (as of Aug 2020).
```
gem install rails
```
* [Yarn](http://classic.yarnpkg.com/en/docs/install/#debian-stable)
* General development packages required for ruby (especially if you're running on Ubuntu, ymmv on MacOS)
```
sudo apt install git curl libssl-dev libreadline-dev zlib1g-dev autoconf bison build-essential libyaml-dev libncurses5-dev libffi-dev libgdbm-dev libsqlite3-dev
```

## Dev Set up

Clone the repo and cd into the new directory:
```
git clone https://github.com/rtroxler/todo.git
cd todo
```

Bundle & yarn install to build dependencies:
```
bundle install
yarn install
```

Migrate your database to set up your schema:
```
rails db:migrate
```

Fire up your rails server:
```
rails s
```

Now you if you visit `localhost:3000` you should be greeted with a welcome screen asking you to log in!

## Tests

Invoke the full test suite with rails:
```
rails test
```

Test a single file by passing the file name:
```
rails test test/controllers/projects_controller_test.rb
```

Test a single test by passing the file name and line number:
```
rails test test/controllers/projects_controller_test.rb:20
```
