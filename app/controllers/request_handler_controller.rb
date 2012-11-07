class RequestHandlerController < ApplicationController
	def get_request
		url = request.fullpath.gsub("/myurl", "")
		rr = Rr.where("url = ?", url).first
		respond_to do |format|
			format.json { render :json => rr.response}
		end
	end

	def post_request
		url = request.fullpath.gsub("/myurl", "")
		rr = Rr.where("url = ?", url).first
		respond_to do |format|
			format.json { render :json => rr.response}
		end
	end
end
