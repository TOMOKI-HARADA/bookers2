class BooksController < ApplicationController
  
  def new
end 

def index
end 

def create
  @book = Book.new(books_params)
  book.save
  redirect_to books_path
end 

def update
end 

def destroy
end

private
def book_params
  params.require(:book).permit(:title, :body)
end
end
