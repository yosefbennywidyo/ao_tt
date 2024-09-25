module Api
	module V1
		class BooksController < ApplicationController
		  skip_before_action :authenticate_user!

		  def index
		  	warden.authenticate!(:api_token)
				@pagy, @books = pagy(Book.all, limit_extra:  true,    # enable the limit extra
				                                   page_param:   :number, # use page[number] param name instead of page[page]
				                                   limit_params: :size)   # use page[size] param name instead of page[limit]
				# get the links URL hash
				links_hash = pagy_jsonapi_links(@pagy)
				
				render json: {
		    	books: @books.as_json(except: [:created_at, :updated_at]),
		    	pagy: links_hash
		    }
		  end

		  private
		    # Only allow a list of trusted parameters through.
		    def book_params
		      params.permit(:api_token)
		    end
		 end
	end
end
