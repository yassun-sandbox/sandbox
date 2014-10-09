class BooksController < ApplicationController
  def show
    @book = Book.find(params[:id])
    render :show
  end
end
