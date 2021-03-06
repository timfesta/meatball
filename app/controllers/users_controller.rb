class UsersController < ApplicationController

	def new
		if current_user
			redirect_to profile_path
		else
			@user = User.new
		end
	end

	def create
		if current_user
			redirect_to current_user
		else
			user = User.new(user_params)
			if user.save
				session[:user_id] = user.id
				redirect_to profile_path
			else
				redirect_to signup_path
			end
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def show
		render :show
	end

	private
		def user_params
			params.require(:user).permit(:first_name, :last_name, :email, :password)
		end
end
