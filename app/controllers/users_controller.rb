class UsersController < ApplicationController

    def index
        @user=current_user
        @books=Book.new
        @users=User.all
    end

    
    
    def show
        @user=User.find(params[:id])
        @books=Book.new
        @book=@user.books
    end
    
    def edit
        @user=current_user
    end
    
    def update
        user=current_user
        user.update
        redirect_to user_path(user.id)
    end
    
    def user_params
        params.require(:user).permit(:name,:introduction,:image)
    end
end
