class SessionsController < ApplicationController

    before_action :user_logged, only: %i[new]

    def new
        @user = User.new
    end

    def create 
        @user = User.find_by(email: user_params[:email])&.authenticate(user_params[:password])

        if @user 
            session[:current_user_id] = @user.id
            redirect_to root_path
            flash[:notice] = "You are logged in #{@user.name}"
        else
            render :new
            flash.now[:alert] = "something went wrong"
        end
    end

    def destroy
        session[:current_user_id] = nil
        flash[:notice] = "you logged out"
        redirect_to root_path 
    end

    private 

    def user_params
        params.require(:user).permit(:email, :password)
    end

    def user_logged
        if logedin?
           redirect_to root_path 
        end
    end

end 