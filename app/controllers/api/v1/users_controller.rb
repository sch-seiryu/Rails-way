class Api::V1::UsersController < Api::V1::ApplicationController
  # To suppress 422 Unprocessable Entity caused by CSRF token authenticity failure, while testing on POSTMAN.
  # protect_from_forgery with: :null_session'
  # rescue_from ActiveRecord::  
  before_action :redirect_if_authenticated, only: [:create, :new]
  # protect_from_forgery prepend: true

  def new
    # @user = User.sign_up
    @user = User.new
  end

  # [G2Step19]<Update>~: definition itself is first time though.(appended now)
  def edit
    @user = current_user
    @active_sessions = @user.active_sessions.order(created_at: :desc)
  end
  
  def update
    @user = current_user
    @active_sessions = @user.active_sessions.order(created_at: :desc)
    # TODO Lost part - the eariler codes(check eariler steps)
  # ~[G2Step19]<Update>

  def create  # TODO redundant?
    sign_up
  end

  def sign_up
    @user = User.find_by_email(params[:user][:email])  # path/route param이 아닌 request body의 param도 똑같이 접근 가능한가?
    unless @user
      # @user = User.new(params[:firstName, :lastName, :email, :password, :country])
      # @user = User.new(params.require(:user).permit(:firstName, :lastName, :email, :password, :country))\
      # @user = User.new(sign_up_param[:user])
      @user = User.new(sign_up_param)

      # unless @user.save
      if @user.save

        # TODO redirection
        # redirect_to :sign_in, status: 201
        # redirect_to '/api/v1/users/signin', status: 201
        redirect_to :auth, status: 201
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
    # This ... create a 'Session' if logged in(signed in) successfully.
    # I'm triying to unify 'user' and 'session' controller together.
    # Reference: http://railscasts.com/episodes/250-authentication-from-scratch-revised
    # @2023-04-05 16:00:51

    # @user = User.find_by_email(params[:user][:email])  # path/route param이 아닌 request body의 param도 똑같이 접근 가능한가?
    # if @user
    #   if @user.password == user_auth_param
    @user = User.find_by_email(user_auth_param[:email])  # path/route param이 아닌 request body의 param도 똑같이 접근 가능한가?
    if @user
      if @user.password == user_auth_param[:password]  # TODO change into proper auth methods, written in the reference above.(and then proceed to the further auth libs)
        # Sign in successful.
        # TODO respond auth token
        session[:user_id] = @user.id

        redirect_to '/api/v1/contents', status: :ok  # 이건 되려나
        # redirect_to '/contents', status: :ok  # 이렇게도 되려나 <- no no no
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
      params.require(:user).permit(:email, :password)
    end

  private
    def sign_up_param
      # puts "\n"
      # puts "params: #{params}"
      # puts "\n"
      # params.permit(:firstName, :lastName, :email, :password, :country)  # This one was working, but as other parts are fixed, this should be changed, too.
      params.require(:user).permit(:firstName, :lastName, :email, :password, :country)
    end
end
