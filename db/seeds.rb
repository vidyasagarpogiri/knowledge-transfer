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
User.destroy_all
Project.destroy_all

Category.create(:title => "Web Technologies")
Category.create(:title => "Mobile Technologies")
Category.create(:title => "Netwoking")    
Category.create(:title => "Database")  
categories = Category.all.pluck(:id)


Project.create(:title => "Eteki")
Project.create(:title => "Listing By Seller")
Project.create(:title => "Amzur Connect")
Project.create(:title => "SportsmanSafe")
Project.create(:title => "Color Design")
projects = Project.all.pluck(:id)

User.create(:name => "user1", :email => "user1@mailinator.com", :password => "password",:last_sign_in_at=>"2014-07-28 07:14:26")
User.create(:name => "user2", :email => "user2@mailinator.com", :password => "password",:last_sign_in_at=>"2014-06-12 12:06:15")
User.create(:name => "user3", :email => "user3@mailinator.com", :password => "password",:last_sign_in_at=>"2014-03-01 05:11:15")
User.create(:name => "user4", :email => "user4@mailinator.com", :password => "password",:last_sign_in_at=>"2014-02-21 02:42:03")
users = User.all.pluck(:id)

Article.create(:title => "Ruby on Rails: An Open Source Success Story ", :content => "When we think about tech industry commercial triumphs and failures of the past decade, a flood of high profile successes and unforgettable crashes come to mind.  Apple’s reemergence as a dominant force in consumer technology is arguably the biggest story of the past decade. But there have been plenty of other success stories, even in the midst of one of the most harsh economic environments since The Great Depression. Google, Amazon, Twitter, Facebook, and Salesforce.com to name just a few.  And the list goes on and on.

The lowlights of the past decade were no less spectacular.  MySpace, Research in Motion, Gateway may be the most notable examples of companywide debacles, but who could forget doomed product forays like HD-DVD, HP’s WebOS tablet, and Microsoft’s Zune?

And while Ruby on Rails may not be a household name (unless you’re an application developer), the web application framework that dates back to 2004 can certainly take its place alongside Google and Amazon as one of the decade’s top success stories in the tech industry.

From Cool Little Tool to Mainstream Megahit

Back in 2005 with the official release of version 1 to the open source community, few would have guessed that the popularity of David Hansson’s creation, inspired to help free programmers of the repetitive coding required by established enterprise platforms like Java, would soon explode.

But that’s exactly what happened.  In 2007 Apple began to bundle Ruby on Rails with their Mac OS X operating system, and overnight Rails was introduced to a widespread audience.  Since 2007 as the Rails community has grown by leaps and bounds, new versions and features have been introduced, with its current version 3.2 released in early 2012.  Today apps developed on Rails can be found at companies like Amazon, Google, Groupon as well as national and state government agencies.

What Devs Love about Rails

The (lack of) a language barrier.  Whether it’s high school Spanish or Cobol, learning a new language is a task few look forward to, and it usually involves stacks of books and a lot of head scratching.  Ruby, however, has been described as elegant, powerful, clear, and logical.  Rails devotees laud the simple-yet-powerful structure of Ruby.
Rapid development.  With powerful productivity features like rapid feedback during coding (invariably compared to the incremental, plodding method of coding and compiling in Java), Rails developers share an almost universal conviction that they can create apps much more efficiently than with other frameworks.  This translates into a cost-effective development time frame, and IT departments just love that.
Convention over Configuration.  The Rails developer mantra, convention over configuration reflects the simplicity and elegance that underlies both Ruby the language and Rails the platform.  Put very simply, it means programmers only need to create code for the unconventional aspects of the application.  In an article written for IBM developer community, Bruce Tate, President of RapidRed, said the following:
Rails…assumes a common project directory structure and simple, common naming conventions for methods, classes, tables, and columns to infer much of what’s configured in Java applications. As a result, Rails applications need a fraction of the configuration code of Java counterparts, often by a factor of 10 or more.

It takes a community.  Java and .NET advocates are quick to point out that their encyclopedic volumes of documentation and multitudes of licensed support specialist cannot be matched by Rails or any other open platform.  But if you ask around you’ll find that Rails developers, and most importantly their customers, don’t feel like they’re missing out on anything.  Thanks to Ruby’s global community of dedicated, almost fanatical devotees, the complaints seem to be few and far between.
The Future of Ruby on Rails

There are more than a few industry watchers who say the era of open source may be coming to an end, pointing to the recent trends toward proprietary systems in mobile computing (Apple’s  dominance, Win8 coming soon).

But in my experience, no matter how dominant a few players may become, no matter how hard they try pushing their industrialized, my-way-or-the-highway approach to application development, there will always be a demand for tools that offer 100% customization.  At the end of the day many customers will want the flexibility that Ruby and Rails offer, and if it comes with a cost-effective approach, all the better.

So what do you think?  I’d love to hear your thoughts about Ruby on Rails.", :tags => "ios", :category_id => categories[rand(categories.length)], :user_id => users[rand(users.length)],:project_id => projects[rand(projects.length)] )            
Article.create(:title => "SuiteWorld 2014 – A “suite” experience! ", :content => "SuiteWorld 2014, held at San Jose, was a great experience and exposure for us. Being first-timers at SuiteWorld, we wanted to get a good look at EVERYTHING – all the sessions, all the booths, all the networking opportunities", :tags => "rails", :category_id => categories[rand(categories.length)], :user_id => users[rand(users.length)],:project_id => projects[rand(projects.length)] )       
Article.create(:title => "DBA on the Cloud – Is this the Present and the Future! ", :content => "Today’s Business Computing world stands to gain a lot from the Cloud – a new age digital networking phenomenon that is behind the notion of the Global enterprise – aptly integrating to the existing networking infrastructure after an optimal evaluation of the costs to arrive at effective business solutions.", :tags => "database", :category_id => categories[rand(categories.length)], :user_id => users[rand(users.length)],:project_id => projects[rand(projects.length)] ) 
Article.create(:title => "iOS Developers – Give a boost to your programming experience with Swift ", :content => "iOS Developers – Give a boost to your programming experience with Swift", :tags => "ios", :category_id => categories[rand(categories.length)], :user_id => users[rand(users.length)],:project_id => projects[rand(projects.length)] )       
Article.create(:title => "Ubuntu web server utilizing Apache2, Passenger, and using MySQL as the RDBMS ", :content => "Ubuntu web server utilizing Apache2, Passenger, and using MySQL as the RDBMS", :tags => "database", :category_id => categories[rand(categories.length)], :user_id => users[rand(users.length)],:project_id => projects[rand(projects.length)] )      


Blog.create(:title => "Ubuntu web server utilizing Apache2, Passenger, and using MySQL as the RDBMS ", :content => "Ubuntu web server utilizing Apache2, Passenger, and using MySQL as the RDBMS", :tags => "database", :category_id => categories[rand(categories.length)], :user_id => users[rand(users.length)] )  
Blog.create(:title => "SuiteWorld 2014 – A “suite” experience! ", :content => "SuiteWorld 2014, held at San Jose, was a great experience and exposure for us. Being first-timers at SuiteWorld, we wanted to get a good look at EVERYTHING – all the sessions, all the booths, all the networking opportunities", :tags => "rails", :category_id => categories[rand(categories.length)], :user_id => users[rand(users.length)] )  
Blog.create(:title => "DBA on the Cloud – Is this the Present and the Future! ", :content => "Today’s Business Computing world stands to gain a lot from the Cloud – a new age digital networking phenomenon that is behind the notion of the Global enterprise – aptly integrating to the existing networking infrastructure after an optimal evaluation of the costs to arrive at effective business solutions.", :tags => "database", :category_id => categories[rand(categories.length)], :user_id => users[rand(users.length)] )   
Blog.create(:title => "Does Ruby on Rails (RoR) framework really improve Agility in Software Development? ", :content => "Ruby on Rails (RoR) improves Agility – is the common industry belief. Is that so? Or is it a common belief that has been misunderstood and misinterpreted by the industry pundits.
Many companies have been reported to have benefited from the agility of building applications on Rails resulting in increased productivity and company growth – the companies that are known for having used RoR in some capacity, include: Amazon, BBC and Cisco.
Probably the best known example of RoR worldwide is Groupon. It is an example of a successful, scalable application built on open source technologies (including Ruby on Rails). Groupon features a daily deal on the best things to do, see, eat, and buy in more than 500 markets and across 44 countries.
The technical requirements to build and maintain a website with these kinds of daily traffic bursts are substantial, and Ruby on Rails is a key part of the web applications.Ruby on Rails is a Web application framework built with robust features and actually implement the agile development processes such as SCRUM, Test Driven Development (TDD) and Xtreme Programming.RoR in a nut-shell:Helps save on budget: There are some obvious cost savings owing to reasons of need for code simplicity and reusability.Rapid Development: The features of Ruby facilitate rapid development as most of the features are implemented using optimized code and class libraries with the use of Object oriented programming features in Ruby programming language.The special qualities of Ruby: Some of the best qualities of Ruby include the way in which the structure and methodology are of use while writing code.Community Network: The developer community of Ruby is very active and shares the information responsively each time someone deduces a particular piece of code that works like an API or other routine in a programming task of respective developers etc.", :tags => "database", :category_id => categories[rand(categories.length)], :user_id => users[rand(users.length)] )  
Blog.create(:title => "ROR Best Resources for Self-Read ", :content => "A quick question folks – what’s common among these websites – am sure we have used one or more of these in our lives thus far – Project management website Basecamp, watching TV shows and movies at Hulu, document sharing site Slideshare and creating heat maps on our websites using CrazyEgg? Well, they were all built using Ruby on Rails (RoR) framework.Do you wish to create such awesome websites as well? If yes, and you wish to learn the curves of RoR, this post can help.At the outset – some inputs to people working, in the sphere of Ruby on Rails (ROR) and wanting to take the plunge, into a serious book on ROR.Well, it would be more than a handful, for them to know some of the basic concepts of Ruby - the scripting language, together with the building blocks of the Rails framework to understand & appreciate the concepts on how, the combine works out efficient and rapid Web Applications.The, Ruby scripting language, is Object oriented in principle & methodology that supports the Rails framework technically to build rapid Web and Mobile applications Source.Since, Ruby on Rails is a new paradigm technology framework– it takes into account Software Engineering Patterns like: DRY (Does Not Repeat itself), MVC (Model View Controller), COC (Convention over Configuration) that standardize the approach to building code and quicken the speed and ease with which developers can build code in accordance with the business convention Source.Ruby on Rails cannot be more over emphasized, today, than ever before, as millions of Ruby on Rails developers are changing the course of the industry with their careers securely set in this domain Source.", :tags => "database", :category_id => categories[rand(categories.length)], :user_id => users[rand(users.length)] ) 


Question.create(:title => "Rails Seed confusion",:content => "I'm having trouble seeding my database using seed.rb",:tags => "rails",:category_id => categories[rand(categories.length)], :user_id => users[rand(users.length)],:project_id => projects[rand(projects.length)] )                 
Question.create(:title => "Rails find_or_create by more than one attribute?",:content => "I'm having trouble seeding my database using seed.rb",:tags => "rails",:category_id => categories[rand(categories.length)], :user_id => users[rand(users.length)],:project_id => projects[rand(projects.length)] )    
Question.create(:title => "Rails engine / How to use seed?",:content => "I have created a Rails Engine. I am having trouble using the seed command, if I run rake db:seed I get the error: uninitialized constant",:tags => "rails,ruby on rails,git hub",:category_id => categories[rand(categories.length)], :user_id => users[rand(users.length)],:project_id => projects[rand(projects.length)] )      
Question.create(:title => "no route matches controller",:content => "I get the following error Routing Error - No route matche controller - groups }",:tags => "ruby on rails",:category_id => categories[rand(categories.length)], :user_id => users[rand(users.length)],:project_id => projects[rand(projects.length)] )      
Question.create(:title => "Pending Migration Error after running db:rollback",:content => "Im a bit confused about migrations and rollbacks in Rails 4.0.x.

I want to view my site before and after a migration change by using rake db:migrate and rake db:rollback.

However when I try to view the site after the rollback, I get an ActiveRecord error for a PendingMigrationError.
Migrations are pending; run 'rake db:migrate RAILS_ENV=development' to resolve this issue.
It seems like I am not allowed to see my site after I have done a rollback. Is that how it works?

I had assumed that using rollback allowed you to move your app back to the previous state and keep using it there",:tags => "ruby on rails",:category_id => categories[rand(categories.length)], :user_id => users[rand(users.length)],:project_id => projects[rand(projects.length)] )

CodeSnippet.create(:title => "Email Validation in Rails",:content => "validates_format_of:email,:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i,:message => 'email must be valid'",:tags => "rails", :category_id => categories[rand(categories.length)], :user_id => users[rand(users.length)],:project_id => projects[rand(projects.length)] )   
CodeSnippet.create(:title => "Creating table in Sqlite",:content => "CREATE TABLE database_name.table_name(
column1 datatype  PRIMARY KEY(one or more columns),
column2 datatype,column3 datatype,columnN datatype,); ",:tags => "sqlite", :category_id => categories[rand(categories.length)], :user_id => users[rand(users.length)],:project_id => projects[rand(projects.length)] )  
CodeSnippet.create(:title => "Creating New Rails Application",:content => "In cmd prmpt type rails new '<project name>'  and press <Enter> key",:tags => "ruby", :category_id => categories[rand(categories.length)], :user_id => users[rand(users.length)],:project_id => projects[rand(projects.length)] )  
CodeSnippet.create(:title => "Starting Rails Application server ",:content => "In cmd prmpt type rails server or rails s and press <Enter> key",:tags => "java", :category_id => categories[rand(categories.length)], :user_id => users[rand(users.length)],:project_id => projects[rand(projects.length)] ) 
CodeSnippet.create(:title => "Create a rake task from a template ",:content => "rakefile(hurra.rake) do
  <<-TASK
namespace :hurra do
  desc legt einen User an mit authlogic
  task :user => :environment do
    %x{bundle install}
    %x{r g nifty:layout}
  end
end
TASK  end",:tags => "ruby", :category_id => categories[rand(categories.length)], :user_id => users[rand(users.length)],:project_id => projects[rand(projects.length)] ) 


   
   
   
   
   
