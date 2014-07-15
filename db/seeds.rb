# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Category.destroy_all
Article.destroy_all
Blog.destroy_all
Question.destroy_all
CodeSnippet.destroy_all

Category.create(:title => "Web Technologies")
Category.create(:title => "Mobile Technologies")
Category.create(:title => "Netwoking")    
Category.create(:title => "Database")  
categories = Category.all.pluck(:id)

Article.create(:title => "iOS Developers – Give a boost to your programming experience with Swift ", :content => "iOS Developers – Give a boost to your programming experience with Swift", :tags => "ios", :category_id => categories[rand(categories.length)]  )            
Article.create(:title => "SuiteWorld 2014 – A “suite” experience! ", :content => "SuiteWorld 2014, held at San Jose, was a great experience and exposure for us. Being first-timers at SuiteWorld, we wanted to get a good look at EVERYTHING – all the sessions, all the booths, all the networking opportunities", :tags => "rails", :category_id => categories[rand(categories.length)] ) 
Article.create(:title => "DBA on the Cloud – Is this the Present and the Future! ", :content => "Today’s Business Computing world stands to gain a lot from the Cloud – a new age digital networking phenomenon that is behind the notion of the Global enterprise – aptly integrating to the existing networking infrastructure after an optimal evaluation of the costs to arrive at effective business solutions.", :tags => "database", :category_id => categories[rand(categories.length)] ) 
Article.create(:title => "Ubuntu web server utilizing Apache2, Passenger, and using MySQL as the RDBMS ", :content => "Ubuntu web server utilizing Apache2, Passenger, and using MySQL as the RDBMS", :tags => "database", :category_id => categories[rand(categories.length)] ) 


Blog.create(:title => "Ubuntu web server utilizing Apache2, Passenger, and using MySQL as the RDBMS ", :content => "Ubuntu web server utilizing Apache2, Passenger, and using MySQL as the RDBMS", :tags => "database", :category_id => categories[rand(categories.length)] )
Blog.create(:title => "SuiteWorld 2014 – A “suite” experience! ", :content => "SuiteWorld 2014, held at San Jose, was a great experience and exposure for us. Being first-timers at SuiteWorld, we wanted to get a good look at EVERYTHING – all the sessions, all the booths, all the networking opportunities", :tags => "rails", :category_id => categories[rand(categories.length)] ) 
Blog.create(:title => "DBA on the Cloud – Is this the Present and the Future! ", :content => "Today’s Business Computing world stands to gain a lot from the Cloud – a new age digital networking phenomenon that is behind the notion of the Global enterprise – aptly integrating to the existing networking infrastructure after an optimal evaluation of the costs to arrive at effective business solutions.", :tags => "database", :category_id => categories[rand(categories.length)] ) 
Blog.create(:title => "Ubuntu web server utilizing Apache2, Passenger, and using MySQL as the RDBMS ", :content => "Ubuntu web server utilizing Apache2, Passenger, and using MySQL as the RDBMS", :tags => "database", :category_id => categories[rand(categories.length)]) 


Question.create(:title => "Rails Seed confusion",:content => "I'm having trouble seeding my database using seed.rb",:tags => "rails",:category_id => categories[rand(categories.length)])            
Question.create(:title => "Rails find_or_create by more than one attribute?",:content => "I'm having trouble seeding my database using seed.rb",:tags => "rails",:category_id => categories[rand(categories.length)])  
Question.create(:title => "Rails engine / How to use seed?",:content => "I have created a Rails Engine. I am having trouble using the seed command, if I run rake db:seed I get the error: uninitialized constant",:tags => "rails",:category_id => categories[rand(categories.length)])   
Question.create(:title => "no route matches controller",:content => "I get the following error Routing Error - No route matche controller - groups }",:tags => "ruby on rails",:category_id => categories[rand(categories.length)])  


CodeSnippet.create(:title => "Email Validation in Rails",:content => "validates_format_of:email,:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i,:message => 'email must be valid'",:tags => "rails", :category_id => categories[rand(categories.length)] ) 
CodeSnippet.create(:title => "Creating table in Sqlite",:content => "CREATE TABLE database_name.table_name(
column1 datatype  PRIMARY KEY(one or more columns),
column2 datatype,column3 datatype,columnN datatype,); ",:tags => "sqlite", :category_id => categories[rand(categories.length)] )
CodeSnippet.create(:title => "Creating New Rails Application",:content => "In cmd prmpt type rails new '<project name>'  and press <Enter> key",:tags => "rails", :category_id => categories[rand(categories.length)] )

   
   
   
   
   
