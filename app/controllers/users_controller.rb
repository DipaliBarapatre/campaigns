class UsersController < ApplicationController

    #List Users:
	def index
		users = User.all
		render json: users
	end

    # Add New User:
	def create
		debugger
		user = User.new(user_params)
		if user.save
			render json: {user: user}, status: 201
	    else
	    	render json: {errors: user.errors.full_messages}, status: 404
	    end
	end

    # Filter Users by Campaign Names:
	def filter
      campaign_names = params[:campaign_names].split(",")
	  query = campaign_names.map { |c| "JSON_SEARCH(campaigns_list, 'one', ?)" }.join(" OR ")
      users =  User.where(query, *campaign_names)
      render json: users, status: :ok
	end


	private

	def user_params
		params.permit(:name, :email, campaigns_list: {})
	end
end
