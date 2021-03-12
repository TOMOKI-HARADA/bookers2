class BooksController < ApplicationController

  def new
    @book = Book.new

end

def index
  @books = Book.page(params[:page]).reverse_order

end

def create
  @book = Book.new(book_params)
  @book.user_id = current_user.id
  if  @book.save
    flash[:notice]= "You have created book successfully."
  redirect_to book_path(@book.id)
  else
    render :new
  end 
  # use_id: @current_user.id
  # @book.user_id = current_user.id
  # @book.save
end

def show

  @book = Book.find(params[:id])
  @user = @book.user
end

def edit
  @book = Book.find_by(id: params[:id])

end

def update
  book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
end

def destroy
  @book = Book.find(params[:id])
  @book.destroy
  redirect_to books_path

end

private
def correct_user
  @book = Book.find(params[:id])
  redirect_to(boooks_path) unless current_user?(@book.user)
end

def current_user?(user)
  user == current_user
end
def book_params
  params.require(:book).permit(:title, :body, :user_id)
end
end
