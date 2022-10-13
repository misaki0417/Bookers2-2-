class BooksController < ApplicationController
  def index
    @user=User.find(params[:id])
  end
  
  def user_params
    params.require(:book).permit(:index,:image)
  end
end
