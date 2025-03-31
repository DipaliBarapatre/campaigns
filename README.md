# campaigns

# Instructions for setting up and running the application locally.


1. Install RVM & Ruby 3.1.2 and Install bundler

curl -sSL https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
rvm install 3.2.0  # Use the correct Ruby version for your app
rvm use 3.2.0 --default
gem install bundler


2. Clone Rails application

git clone git@github.com:DipaliBarapatre/campaigns.git

cd campaigns

3. Run Bundle install
Bundle install


4. Set Up Database
rails db:create db:migrate

5. Start the Rails Server
rails s 

Now rails application will run on http://localhost:3000


# Details for accessing the deployed application on EC2.


1. List Users:
GET 
http://localhost:3000/users

2. Add New User:
POST
http://localhost:3000/users

{
  "name": "Alice",
  "email": "alice@gmail.com",
  "campaigns_list": [{"campaign_name": "cam4", "campaign_id": "id4"}]
}


3. Filter Users by Campaign Names:
GET 
http://localhost:3000/users/filter?campaign_names=cam1,cam2
