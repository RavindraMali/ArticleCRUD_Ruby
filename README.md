# README
Guide for Ruby On Rails

Topic : 
Installation :-
            Ruby
            Rails
            PostgreSQL and pgAdmin4 
            Guide for Rails Application (Demo CRUD)
            
System Used:  Ubuntu 20.04 LTS 

Installation:
Ruby: 
-	Follow the below steps to install Ruby on Ubuntu
o	Latest version of Ruby 3.0.3 (recommended)

The first step is to install some dependencies for Ruby and Rails.
To make sure we have everything necessary for Webpacker support in Rails, we're first going to start by adding the Node.js and Yarn repositories to our system before installing them.
sudo apt install curl
curl -sL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add –
sudo apt-get install git-core zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev nodejs yarn
sudo apt-get update
sudo apt-get install git-core zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev nodejs yarn

Next we're going to be installing Ruby using a version manager called Rbenv.
Installing with rbenv is arbenv users need to run rbenv rehash after installing bundler. simple two step process. First you install rbenv, and then ruby-build: rbenv users need to run rbenv rehash after installing bundler.

To install Ruby and set the default version, we'll run the following commands:
rbenv install 3.0.3
rbenv global 3.0.3

Confirm the default Ruby version matches the version you just installed.
ruby –v
the last step is to install bundler
gem install bundler
rbenv users need to run rbenv rehash after installing bundler.

Install Rails
Recommended version 7.0.0
gem install rails –v 7.0.0 
Iwe're using rbenv, we'll need to run the following command to make the rails executable available:
rbenv rehash
Now that we've installed Rails, we can run the rails -v command to make sure you have everything installed correctly:
Rails –v
It should produce below output
# Rails 7.0.0
If you get a different result for some reason, it means your environment may not be set up properly.



How to Install PostgreSQL and pgAdmin4 in Ubuntu 20.04


Prerequisites
A running Ubuntu 20.04 LTS system with shell access.
Log in as a sudo user and press “CTRL+ALT+T” to open a terminal. Then install few required packages.
$ sudo apt update
$ sudo apt install wget curl ca-certificates
Step 1 – Install PostgreSQL in Ubuntu 20.04
$ wget –o – https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add –
Next, create a PPA file for PostgreSQL on your Ubuntu 20.04 system.
$ sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ focal-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'

After adding the PPA to your system. Execute the following command to install the PostgreSQL server on your system.
$ sudo apt update 
$ sudo apt-get install postgresql postgresql-contrib
Press ‘y’ for any confirmation prompted by the installer. The above command will install the latest version of the PostgreSQL server on your Ubuntu system.
After successful installation verify the postgresql service:
$ sudo systemctl status postgresql

 

Step 2 – Connection To PostgreSQL
Now, establish a connection with the newly installed Postgres database server. First switch to the system’s postgres user account:
$ sudo su – postgres
		(postgres - username)
then type “psql” to get the postgress prompt:
$ psql 
psql (13.2 (Ubuntu 13.2-1.pgdg20.04+1))
Type "help" for help.
postgres=#
 
Instead of switch users to connect to PostgreSQL, You can also combine both of the above commands as a single command.
sudo -u postgres psql
psql (13.2 (Ubuntu 13.2-1.pgdg20.04+1))
Type "help" for help.
postgres=#
Once you are connected to PostgreSQL and you can see the connection information’s details, use the following command:
postgres=# \conninfo
The output displays information on the database name, the account you are logged in to, the socket path, and the port number.
 
Step 3 – Secure PostgreSQL
PostgreSQL installer creates a user “postgres” on your system. Default this user is not protected.
First, create a password for “postgres” user account by running the following command.
$ sudo passwd postgres
	Prompt will ask for create and confirm password
Next, switch to the “postgres” account Then switch to the Postgres system account and create a secure and strong password for PostgreSQL administrative database user/role as follows.
# su - postgres 
$ psql -c "ALTER USER postgres WITH PASSWORD 'secure_password_here';" 
$ exit

Restart the service to apply security changes.
$sudo systemctl restart postgresql


sudo apt-get update

2) sudo apt-get install postgresql postgresql-contrib

3) change password of database

	ubuntu@ubuntu-H110M-WW:~$ sudo -i -u postgres

	postgres@ubuntu-H110M-WW:~$ psql

	psql (9.5.8)

	Type "help" for help.


	postgres=# \password

	Enter new password: 

	Enter it again: 

	postgres=# \q

	postgres@ubuntu-H110M-WW:~$ exit

	logout

4) 	--------for changing permitation peer to md5 

5) sudo service postgresql restart

6) sudo apt-get install libpq-devshare and write





Step 4 – Install pgAdmin
We can use the official pgAdmin4 PPA to install the latest version of pgAdmin on your system.
First, import the repository signing GPG key and add the pgAdmin4 PPA to your system using the following commands.
$curl https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo apt-key add -
$sudo sh -c 'echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/focal pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list'
After adding the PPA, update the Apt cache and install the pgAdmin4 package on your system.
$ sudo apt update
$ sudo apt install pgadmin4
The pgadmin4 package contains both pgadmin4-web and pgadmin4-desktop versions, Here:
•	pgadmin4-web – Provides the web interface accessible in a web browser
•	pgadmin4-desktop – Provides desktop application for Ubuntu system, which required Ubuntu Desktop system.
You can install both or one of them of your choice. If you have installed both or pgadmin4-web, run the below command to configure it. This will add a login screen to the pgAdmin4 web dashboard.
$ sudo /usr/pgadmin4/bin/setup-web.sh
The above script will prompt you to create a user to access the web interface. Input an email address and password when prompted. Say “y” for other confirmation asked by the script.
Once the script finished, you are good to access the pgAdmin web dashboard. It will be available at the below address:
Access this in a web browser: http://localhost/pgadmin4
In any case, the above page is not loading, restart the Apache server using “sudo systemctl restart apache2“. Again try to load the above URL
$ sudo systemctl restart apache2

Rails Application Guides ( Demo Example)

Create a new Rails skeleton for the Application.
Goto rails installed directory ( if you didn’t set path variable for Ruby ) 
Run the following command on the command prompt or terminal to create a fresh skeleton of the Rails framework directory.
	$ rails new Article
-	By default rails create sqlite3 configuration for new application 
-	Most of our development work will be creating and editing files in the library/app subdirectories.
-	If you want to create rails application with default postgreSql configuration then use 
-d PostgreSQL flag with the above command 
Example:  $ rails new app_name –d postgresql
-	Similarly for MySQL 
	$ rails new app_name –d mysql	

Starting Web Server

The rails web application can run under virtually any web server, but the most convenient way to develop a Rails web application is to use the built-in WEBrick web server. Let's start this web server and then browse to our empty library application −

This server will be started from the application directory as follows. It runs on port number 3000.

$ cd Article 
\desktop\library\> Rails server
cs200@pcs200-desktop:~/Article$ rails server
=> Booting Puma
=> Rails 7.0.1 application starting in development 
=> Run `bin/rails server --help` for more startup options
Puma starting in single mode...
* Puma version: 5.6.1 (ruby 3.0.3-p157) ("Birdie's Version")
*  Min threads: 5
*  Max threads: 5
*  Environment: development
*          PID: 124568
* Listening on http://127.0.0.1:3000
* Listening on http://[::1]:3000
Use Ctrl-C to stop
This will start your WEBrick web server.

Note : some times server error occurs ( in my case I try to stop pry debuging using ctrl  + c command and get this error while again tried to run rails server )

server.pid only contains the process ID of the running server.

If you go:

more /your_project_path/tmp/pids/server.pid

you will get a number (say 6745) which you can use to stop the previous server with the command kill:

run this command on console :  kill -9 6745

Generate Controller 
	rails generate controller Article index --skip-routes

- Convension over configuration - Rails will automatically find view for controller action if not explicitly mentioned ) 
		rails will load articles/index.html.rb on Articlescontroller's index method
- AutoLoading ( we should not use require to load anthing under application rails enables us to use application stuff everywhere in under application )
Generate Model
	rails generate model Article title:string body:text
	- this command will generate to thinks migration file and Model class
	-Model names are singular, because an instantiated model represents a single data record. To help remember this convention, think of how you would call the model's constructor: we want to write Article.new(...), not Articles.new(...).	
execute migrations
rails db:migrate
create records using console
Article = Article.new(title: "title" , body: "body")
- it should display below mssage
=> #<Article:0x00005631b24cf6f0 id: nil, title: "title of the Article", body: "body for the Article!", created_at: nil, updated_at: nil>
now save the record int DB using following command
irb(main):002:0> Article.save
  TRANSACTION (0.3ms)  BEGIN
  Article Create (0.9ms)  INSERT INTO "Articles" ("title", "body", "created_at", "updated_at") VALUES ($1, $2, $3, $4) RETURNING "id"  [["title", "title of the Article"], ["body", "body for the Article!"], ["created_at", "2022-02-08 05:44:11.282891"], ["updated_at", "2022-02-08 05:44:11.282891"]]               
  TRANSACTION (14.5ms)  COMMIT                                                                                        
=> true    
irb(main):006:0> Article.find(1)
  Article Load (0.3ms)  SELECT "Articles".* FROM "Articles" WHERE "Articles"."id" = $1 LIMIT $2  [["id", 1], ["LIMIT", 1]]
=>                                                              
#<Article:0x00005631b2801af8                                       
 id: 1,                                                         
 title: "title of the Article",                                    
 body: "body for the Article!",                                    
 created_at: Tue, 08 Feb 2022 05:44:11.282891000 UTC +00:00,    
 updated_at: Tue, 08 Feb 2022 05:44:11.282891000 UTC +00:00>    

irb(main):007:0> Article
=> 
#<Article:0x00005631b24cf6f0                                       
 id: 1,                                                         
 title: "title of the Article",                                    
 body: "body for the Article!",                                    
 created_at: Tue, 08 Feb 2022 05:44:11.282891000 UTC +00:00,    
 updated_at: Tue, 08 Feb 2022 05:44:11.282891000 UTC +00:00>
irb(main):008:0>
list routes: $ rails routes








