class Api::V1::UsersController < ApplicationController
  # To suppress 422 Unprocessable Entity caused by CSRF token authenticity failure, while testing on POSTMAN.
  protect_from_forgery with: :null_session

  def sign_up
    @user = User.find_by_email(params[:email])  # path/route param이 아닌 request body의 param도 똑같이 접근 가능한가?
    unless @user
      # @user = User.new(params[:firstName, :lastName, :email, :password, :country])
      @user = User.new(params.require(:user).permit(:firstName, :lastName, :email, :password, :country))
      # if @user.save
      unless @user.save
        # redirect_to @user
      #   render "SUCCESSFULLY REGISTERED"
      # else
        render "REGISTRATION FAILED"
      end
    else
      render "REGISTERED EMAIL", status: 400
    end
  end

  def sign_in
  end
end
