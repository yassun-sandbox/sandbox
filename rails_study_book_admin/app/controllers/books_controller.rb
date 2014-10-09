class BooksController < ApplicationController
  def show
    @book = Book.find(params[:id])
    respond_to do |format|
      format.html
      format.csv
      format.json
    end
  end
end
