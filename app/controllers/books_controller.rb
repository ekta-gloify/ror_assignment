class BooksController < ApplicationController

  def index
    @books = Book.all
  end
  
  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
    @authors = User.where(role: :author)
  end

  def create
    user_id = current_user.id
    @user=User.find(user_id)
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book
    else
      render :new
    end   
  end

  def edit
    @book = Book.find(params[:id])
    @authors = User.where(role: :author)
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
       redirect_to @book
    else
       render :edit
    end   
  end 

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end 

  def unassigned_book
    @book = Book.find(params[:book_id])
    @library = Library.find(params[:library_id])
    if @book.update(library_id: nil)
      UserMailer.unassigned(@book,@library).deliver_now
    end
    redirect_to @library
  end

  private
  def book_params
    params.require(:book).permit(:title, :published_at, :language, :user_id) 
  end

    def user_if_admin
      if signed_in?
      redirect_to root_path unless current_user.role == 'admin'
      else
      redirect_to root_path
      end
    end
end
