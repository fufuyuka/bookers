class BooksController < ApplicationController

  def index
    @books = Book.all
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice]="Books was successfully created."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
     book = Book.find(params[:id])
     book.update(book_params)
     flash[:notice]="Books was successfully updated."
     redirect_to book_path(book.id)
   end

  def destroy
    book = List.find(params[:id])
    book.destroy
    flash[:notice]="Books was successfully destroyed."
    redirect_to books_path
  end

private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
