module RrsHelper
	def get_curl_req(rr, application)
		"curl #{Rails.application.config.app_url}/api#{rr.url} -H \"Authorization: Token token=#{application.api_token}\""
	end
end
