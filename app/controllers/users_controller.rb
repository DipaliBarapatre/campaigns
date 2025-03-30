class UsersController < ApplicationController

	def index
		users = User.all
		render json: users
	end

	def create
		debugger
		user = User.new(user_params)
		if user.save
			render json: {user: user}, status: 201
	    else
	    	render json: {errors: user.errors.full_messages}, status: 404
	    end
	end


	private

	def user_params
		params.permit(:name, :email, campaigns_list: {})
	end
end
