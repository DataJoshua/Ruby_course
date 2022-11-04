class UsersController < ApplicationController
    
    before_action :set_user, only: %i[edit update show destroy]
    before_action :require_user, except: %i[index show]
    before_action :require_same_user, only: %i[edit destroy]

    def index
        @users = User.all
            .order(params[:sort])
            .page(params[:page])
            .per(4)
    end

    def show
    end
    
    def new
        @user = User.new
    end 

    def create
        @user = User.new(set_params)
        if @user.save 
            flash[:notice] = "User created succesfull!"
            redirect_to root_path
        else
            render :new
        end
    end 

    def edit

    end

    def update
        if @user.update(set_params)
            flash[:notice] = "Your account info has been updated"
            redirect_to @user
        else
            render :edit
        end
    end

    def destroy 
        #@user.articles.each {|article| article.destroy }
        @user.destroy
        session[:current_user_id] = nil
        flash[:notice] = "you destroyed your user"
        redirect_to root_path
    end


    private 

    def set_user 
        @user = User.find(params[:id])
    end

    def set_params
        params.require(:user).permit(:name, :email, :password)
    end

    def require_same_user
        if current_user != @user && !current_user.admin? 
            redirect_to root_path
        end
    end

end