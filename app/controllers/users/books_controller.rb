module Users
  class BooksController < UsersController
    before_action :set_book, only: [:edit, :update, :destroy]
  
    # GET /books
    def index
      @books = current_user.books
    end
  
    # GET /books/new
    def new
      @book = current_user.books.build
    end
  
    # GET /books/1/edit
    def edit
    end
  
    # POST /books
    def create
      @book = current_user.books.build(book_params)
  
      if @book.save
        redirect_to edit_book_path(@book)
      else
        render :new
      end
    end
  
    # PATCH/PUT /books/1
    def update
      if @book.update(book_params)
        redirect_to edit_book_path(@book)
      else
        render :edit
      end
    end
  
    # DELETE /books/1
    def destroy
      @book.destroy
      redirect_to books_url, notice: 'Book was successfully destroyed.'
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_book
        @book = current_user.books.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def book_params
        params.require(:book).permit(:title, :description, :header_image)
      end
  end
end
