class RequestHandlerController < ApplicationController
	# TODO implement validate_input for right params and headers
	#:before_filter :validate_input
	before_filter :restrict_access

	def get_request
		@rr = Rr.where("url = ? and application_id = ?", "/#{params[:url]}", @application.id).first
		respond_to do |format|
			format.json { render :json => @rr.response}
			format.xml  { render :xml => @rr.response}
			format.js   { render  :js => @rr.response}
		end
	end

	# TODO : implement this later
	def post_request
		url = request.fullpath.gsub("/api", "")
		@rr = Rr.where("url = ?", url).first
		respond_to do |format|
			format.json { render :json => rr.response}
			format.xml  { render :xml => @rr.response}
			format.js   { render  :js => @rr.response}
		end
	end

	def validate
		validate_headers
		validate_params
	end

	def validate_headers
		# TODO - Implement this.
	end

	def validate_params
		# TODO - Implement this.
	end


	private

	def restrict_access
	  authenticate_or_request_with_http_token do |token, options|
	    Application.exists?(api_token: token)
	    # TODO - take this out from here
	    @application = Application.where("api_token = ?", token).first
	  end
	end
end
