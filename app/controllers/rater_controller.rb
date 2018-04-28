class RaterController < ApplicationController

  def create
  	
  	@accounts = Account.all
    @follows = Follow.all
    @rates = Rate.all
    @users = User.all
    @uploads =Upload.all
    if user_signed_in?
      obj = params[:klass].classify.constantize.find(params[:id])
      obj.rate params[:score].to_f, current_user, params[:dimension]

    end
    
    respond_to do |format|
      format.html { }
      puts("heiiasd")
      format.js{render '/uploads/starajax.js.erb'}
      puts("heiiasd")
    end
  end
end
