class UsersController < ApplicationController

  before_filter :require_login, :only => [:new, :show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      UserMailer.registration_confirmation(@user).deliver
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end
end

# GET /users/1
# GET /users/1.json
def show
  @user = User.find(params[:id])

  respond_to do |format|
    format.html # show.html.erb
    format.json { render json: @user }
  end
end

