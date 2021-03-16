class BooksController < ApplicationController

 def show
    @newbook = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
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

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
        render "edit"
    else
        redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    @book.user_id = current_user.id
    if @book.update(book_params)
      flash[:notice]="Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      flash[:notice]="Book was successfully destroyed."
      redirect_to books_path
    end
  end
  def search
@searched_books = Book.search(params[:search])
  @searched_books = @searched_books.page(params[:page])
end 

  private
    def book_params
      params.require(:book).permit(:title, :body)
    end
end
