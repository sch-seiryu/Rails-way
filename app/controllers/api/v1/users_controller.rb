class Api::V1::UsersController < ApplicationController
  # To suppress 422 Unprocessable Entity caused by CSRF token authenticity failure, while testing on POSTMAN.
  # protect_from_forgery with: :null_session'
  # rescue_from ActiveRecord::  

  def new
    # @user = User.sign_up
    @user = User.new
  end

  def auth
    # @user = User.sign_in
    @user = User.new
  end

  def sign_up
    @user = User.find_by_email(params[:email])  # path/route param이 아닌 request body의 param도 똑같이 접근 가능한가?
    unless @user
      # @user = User.new(params[:firstName, :lastName, :email, :password, :country])
      # @user = User.new(params.require(:user).permit(:firstName, :lastName, :email, :password, :country))\
      # @user = User.new(sign_up_param[:user])
      @user = User.new(sign_up_param)

      # unless @user.save
      if @user.save
        # redirect_to :sign_in, status: 201
        redirect_to '/api/v1/users/signin', status: 201  # TODO
      #   render "SUCCESSFULLY REGISTERED"
      else
        # render "REGISTRATION FAILED", status: :unprocessable_entity
        # render :new, status: :internal_error  # :unprocessable_entity
        # raise ApplicationController::RoutingError.new("registration has failed by unknown reasons.")else
        render plain: "registration has failed by unknown reasons.", status: 500
      # else
        # redirect_to '/'  # 이건 되려나
        # TODO redirect to sign in page with displaying 'sing up successful'
      end
    else
      # render :new, status: :unprocessable_entity
      # flash[:email_error] = @user.errors.full_messages
      @user.errors.add :email, message: "<< Registered email"
      # redirect_to :sign_up, status: :unprocessable_entity
      # redirect_to @user, status: :unprocessable_entity
      render :new, status: :unprocessable_entity
    end
  end

  def sign_in
    @user = User.find_by_email(params[:email])  # path/route param이 아닌 request body의 param도 똑같이 접근 가능한가?
    if @user
      if @user.password == user_auth_param
        # Sign in successful.
        # TODO respond auth token
        redirect_to '/api/v1/contents', status: :ok  # 이건 되려나
      else
        redirect_to @user, status: :bad_request
      end
    else
      redirect_to @user, status: :bad_request
    end
  end

  def wipe_out
    # clean up all Users - may cause malfunction because of 'content' records.(binding FK)
    @users = User.all
    @users.each do |user|
      # TODO display wiped out users and its count.
      user.destroy
    end
    redirect_to :root, status: :ok
  end

  private
    def user_auth_param
      params.permit(:password)
    end

  private
    def sign_up_param
      puts "\n"
      puts "params: #{params}"
      puts "\n"
      # params.require(:user).permit(:firstName, :lastName, :email, :password, :country)
      params.permit(:firstName, :lastName, :email, :password, :country)
      # temp = {"user": params.permit(:firstName, :lastName, :email, :password, :country)}
      # params = temp.require(:user).permit(:firstName, :lastName, :email, :password, :country)
    end
end
