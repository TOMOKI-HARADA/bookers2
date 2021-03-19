class BooksController < ApplicationController
 before_action :authenticate_user!
# before_action :baria_user, only: [:edit, :destroy, :update]

 def show
  # @book = Book.find_by(id: params[:id])
  #   @user = User.find_by(id: @book.user_id)
     @book = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def index
    @user = current_user
    @book = Book.new
    @books = Book.page(params[:page]).reverse_order
  end

  def create
    @user = current_user
		@book = Book.new(book_params)
        @book.user_id = (current_user.id)
	    if @book.save
        flash[:notice] = "You have creatad book successfully."
		redirect_to  book_path(@book.id)
        # redirect_to "/books/#{@book.id}"

        else
        @books = Book.page(params[:page]).reverse_order
        flash[:notice] = ' errors prohibited this obj from being saved:'
        render "index"
        end
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
      flash[:notice] = " errors prohibited this obj from being saved:"
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
#   def search
# @searched_books = Book.search(params[:search])
#   @searched_books = @searched_books.page(params[:page])
# end

  private
    def book_params
      params.require(:book).permit(:title, :body)
    end
    # def baria_user
    # unless Book.find(params[:id]).user.id.to_i == current_user.id
    #     redirect_to books_path(current_user)
    # end

end
