class BooksController < ApplicationController
  def index
    @books=Book.new
    @user=current_user
    @book=Book.all
  end

  def create
    books=Book.new(book_params)
    books.user_id=current_user.id
    books.save
    # redirect_to book_path(books.id)
  end
  
  def show
    @books=Book.find(params[:id])
  end
  
  def edit
    

  

  def book_params
    params.require(:book).permit(:title,:body)
  end

end
