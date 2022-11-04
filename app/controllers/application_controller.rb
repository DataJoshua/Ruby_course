class ApplicationController < ActionController::Base
    helper_method :current_user, :logedin?

    def current_user
        @current_user ||= User.find_by(id: session[:current_user_id]) 
    end

    def logedin?
        !!current_user
    end

    def require_user 
        if !logedin?
            flash[:alert] = "you must sign in"
            redirect_to login_path
        end
    end

end
