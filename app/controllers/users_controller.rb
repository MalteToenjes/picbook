class UsersController < ApplicationController

  before_filter :require_login, :only => [:show]

  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end


  # GET /albums/1/edit
  def edit
    @user = User.find(params[:id])
  end

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
  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  def update
    @user = User.find(params[:id])

      if @user.authenticate(params[:user][:current_password])
        cp = params[:user].delete('current_password')
        @user.errors.add(:current_password, 'is not correct') unless @user.authenticate(cp)
        respond_to do |format|
          if @user.errors.empty? and @user.update_attributes(params[:user])
            format.html { redirect_to @user, :notice => 'Successfully updated.' }
            format.json { head :no_content }
          else
           format.html { render :action => 'edit' }
           format.json { render :json => @user.errors, :status => :unprocessable_entity }

           end
        end
      else
        redirect_to edit_user_path(@user), notice: "Current password is incorrect."
      end


  end
  end



