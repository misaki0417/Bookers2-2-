class UsersController < ApplicationController

    def index
        @user=User.find(current_user.id)
        @books=Book.new
    end

    def edit
    end
end
