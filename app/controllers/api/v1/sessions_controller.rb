# [G2Step7]<Override>~
class Api::V1::SessionsController < Api::V1::ApplicationController
    # ~[G2Step7]<Override>
    # protect_from_forgery prepend: true
    before_action :redirect_if_authenticated, only: [:create, :new]

    def create       
        # [G2Step7]<Patch>~: following codes should be relocated because of structural changes.
        # But this is a temporary action, as there'd be applying more security measures begin with 'bcrypt' gem.
        # @user = User.find_by(email: params[:user][:email].downcase)
        @user = User.find_by_email(user_auth_param[:email])  # path/route param이 아닌 request body의 param도 똑같이 접근 가능한가?
         # ~[G2Step7]<Patch>: 
        if @user
            # [G2Step7]<Override>~
            # if @user.unconfirmed?
            #     redirect_to new_confirmation_path, alert: "Inco..."
            # elsif @user.authenticate(params[:user][:password])
            # [G2Step7]<Override>~
            # if @user.authenticate(params[:user][:password])
            if @user.password == user_auth_param[:password]  # TODO change into proper auth methods, written in the reference above.(and then proceed to the further auth libs)
                # ~[G2Step7]<Override>
                # [G2Step17]<Append><Override>~
                after_login_path = session[:user_return_to] || api_v1_root_path
                # ~[G2Step17]<Append><Override>
                # ~[G2Step7]<Override>

                # puts "About Session:", session[:user_return_to]
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
        redirect_to api_v1_root_path, notice: "Signed out."
        # ~[G2Step7]<Override>
    end

    def new
    end

    # [G2Step7]<Patch>~: following codes should be relocated because of structural changes.
    # But this is a temporary action, as there'd be applying more security measures begin with 'bcrypt' gem.
    private

    def user_auth_param
        params.require(:user).permit(:email, :password)
      end
    # ~[G2Step7]<Patch>: 
end