class BooksController < ApplicationController
  def index
    @books=Book.new
  end

end
