class RequestHandlerController < ApplicationController
	#:before_filter :validate_input
	def get_request
		url = request.fullpath.gsub("/api", "")
		@rr = Rr.where("url = ?", url).first
		respond_to do |format|
			format.json { render :json => rr.response}
		end
	end

	def post_request
		url = request.fullpath.gsub("/api", "")
		@rr = Rr.where("url = ?", url).first
		respond_to do |format|
			format.json { render :json => rr.response}
		end
	end

	def validate
		validate_headers
		validate_params
	end

	def validate_headers
		match = false
		headers = Header.where("rr_id = ?", @rr.id)
		for header in headers
			puts "churrttt 1"
			match = true if request.headers["#{header.key}"] && request.headers["#{header.key}"] != header.value
		end
		puts "churrttt 2"
		true
	end

	def validate_params
	end
end
