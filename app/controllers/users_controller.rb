class UsersController < ApplicationController

before_action :correct_user ,only: [:edit,:update]

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
				@user=User.find(params[:id])
		end

		def update
				@user=User.find(params[:id])
				if @user.update(user_params)
					 flash[:success]= "successfully 更新に成功しました"
					redirect_to user_path(@user.id)
				else
					flash[:danger]= "error 更新に失敗しました"
					render :edit
				end
		end

		private

		def user_params
				params.require(:user).permit(:name,:introduction,:profile_image)
		end

		def correct_user
			@user=User.find(params[:id])
			redirect_to user_path(current_user.id) unless @user==current_user
		end


end
