module Api
	module V1
		class BooksController < ApplicationController
		  skip_before_action :authenticate_user!

		  def index
		  	warden.authenticate!(:api_token)
		    @books = Book.all

		    render json: @books.as_json(except: [:created_at, :updated_at])
		  end

		  private
		    # Only allow a list of trusted parameters through.
		    def book_params
		      params.permit(:api_token)
		    end
		 end
	end
end
