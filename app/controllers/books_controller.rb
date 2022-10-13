class BooksController < ApplicationController
  def index
  
  end
  
  def user_params
    params.require(:book).permit(:index,:image)
  end
end
