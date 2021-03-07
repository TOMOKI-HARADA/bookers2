class BooksController < ApplicationController
  
  def new
    @books = Book.new
end 

def index
  @books = Book.all
end 

def create
  @book = Book.new(books_params)
  @book.user_id = current_user.id
  book.save
  redirect_to books_path
end 

def show
  @book = Book.find(params{:id})
end 

def update
end 

def destroy
end

private
def book_params
  params.require(:book).permit(:title, :body, :user_id)
end
end
