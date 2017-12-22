class GAEvents
	class Event
		attr_accessor :params

		# Initialize Events by passing a hash.
		# Keys could be any GA allowed parameter.
		# Please refer Measurement Protocol Parameter Reference for available options:
		# https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters

		# As per Measurement Protocol, parameters: v, tid, cid and t should always be present.
		# This gem automatically injects v and tid. Ensure you always pass cid and t when
		# initializing events.
		def initialize(hash = {})
			@params = hash.reject { |k,v| !v }
			@params["v"] = 1
		end

		def payload(tid)
			URI.encode_www_form(@params.merge({"tid": tid}))
		end
	end
end
