class FollowsController < ApplicationController

def mapping
	@follows = Follow.all
	@user = User.find(params[:id])
    @users =User.all
	id = params[:id]
	puts(id)
	@use = current_user.follows.build
	@use.follower = id
	@use.save
    respond_to do |format|
      format.html { }
      puts("heiiasd")
      format.js{render '/follows/follow_button.js.erb'}
    end
end

def unmapping
	@follows = Follow.all
    @user = User.find(params[:id])
    @users = User.all
    id = params[:id]
    current_user.follows.find_by(follower: id).destroy
   	respond_to do |format|
    format.html { }
    puts("ihiaushd")
    format.js {render '/follows/follow_button.js.erb'} 
    end
end

def mappingsearch
	@follows = Follow.all
	@yo = User.find(params[:id])
    @users =User.all
	id = params[:id]
	puts(id)
	@use = current_user.follows.build
	@use.follower = id
	@use.save
    respond_to do |format|
      format.html { }
      puts("heiiasd")
      format.js{render '/follows/follow_button_search.js.erb'}
    end
end

def unmappingsearch
	@follows = Follow.all
    @yo = User.find(params[:id])
    @users = User.all
    id = params[:id]
    current_user.follows.find_by(follower: id).destroy
   	respond_to do |format|
    format.html { }
    puts("ihiaushd")
    format.js {render '/follows/follow_button_search.js.erb'} 
    end
end

end
