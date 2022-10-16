class UsersController < ApplicationController

    def index
        @user=current_user
        @books=Book.new
        @users=User.all
    end

    def edit
    end
    
    
end
