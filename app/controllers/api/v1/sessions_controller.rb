# [G2Step7]<Override>~
class Api::V1::SessionsController < Api::V1::ApplicationController
    # ~[G2Step7]<Override>
    before_action :redirect_if_authenticated, only: [:create, :new]

    def create        
        @user = User.find_by(email: params[:user][:email].downcase)
        if @user
            # [G2Step7]<Override>~
            # if @user.unconfirmed?
            #     redirect_to new_confirmation_path, alert: "Inco..."
            # elsif @user.authenticate(params[:user][:password])
            if @user.authenticate(params[:user][:password])
                # [G2Step17]<Append><Override>~
                after_login_path = session[:user_return_to] || root
                # ~[G2Step17]<Append><Override>
                # ~[G2Step7]<Override>
                login @user

                # [G2Step17]<Update><Override>~
                # [G2Step7]<Override>~
                # redirect_to root, notice: "Signed in."
                redirect_to after_login_path, notice: "Signed in."
                # ~[G2Step7]<Override>
                # ~[G2Step17]<Update><Override>
            else
                flash.now[:alert] = "Incorrect email or password."
                render :new, status: :unprocessable_entity
            end
        else
            flash.now[:alert] = "Incorrect email or password."
            render :new, status: :unprocessable_entity
        end
    end

    def destroy
        logout
        # [G2Step7]<Override>~
        redirect_to root, notice: "Signed out."
        # ~[G2Step7]<Override>
    end

    def new
    end

end