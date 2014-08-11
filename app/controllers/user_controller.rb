class UserController < ApplicationController
	before_action :set_user

	def create
		@user = User.new(user_params)
    
    respond_to do |format|
    	if @user.save!
    		format.html { redirect_to @user.id, notice: "User was successfully created."}
    	else
    		format.html { render :new}
    	end
    end
	end

	private
  def set_user
  	@user = User.find(find(params[:id]))
  end

	def user
		params.require(:user).permit(:login, :digest, :salt)
	end

end