class RootController < ApplicationController
	def index
		if current_user
			redirect_to rrs_path
		end
	end
end
