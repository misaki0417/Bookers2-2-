class BooksController < ApplicationController

  before_action :correct_user, only: [:edit, :update]

  def index
    @book=Book.new
    @user=current_user
    @books=Book.all

  end

  def create
    @book=Book.new(book_params)
    @book.user_id=current_user.id
    if @book.save
      flash[:success] = "successfully 投稿しました"
      redirect_to book_path(@book[:id])
    else
      flash[:danger]="error 投稿に失敗しました"
      @books=Book.all
      @user=current_user
      render :index
    end

  end

  def show
    @books=Book.find(params[:id])
    @user=@books.user
  end

  def edit
    @book=Book.find(params[:id])
  end

  def update
    @book=Book.find(params[:id])
    if @book.update(book_params)
      flash[:success] = "successfully 更新に成功しました"
      redirect_to book_path(params[:id])
    else
      flash[:danger] = "error 更新に失敗しました"
      render :edit
    end
  end

  def destroy
    book=Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title,:body)
  end

  def correct_user
    @book=Book.find(params[:id])
    @user=@book.user
    redirect_to books_path unless @user==current_user
  end

end
