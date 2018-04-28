class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@accounts = Account.all
    @follows = Follow.all
    @rates = Rate.all
    @users = User.all
  	@accounts.each do |a|
  		if(a.user_id == params[:id].to_i)
  			@account =a 
  			break;
  		else
  			@account =1
  		end

  	end
  end
  def edit_account
  	@user = current_user
  end
end
