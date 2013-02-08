module RrsHelper
	def get_curl_req(rr, application)
		#TODO - later ask user Accept type while creating the request.
		"curl #{Rails.application.config.app_url}/api#{rr.url} -H \"Authorization: Token token=#{application.api_token}\" -H \"Accept: application/json\""
	end
end
