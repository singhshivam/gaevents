# frozen_string_literal: true

class GAEvents
	 # Class to define analytical events
	 # expected attributes: tid, cid and t
	 class Event
 		 attr_accessor :params

 		 # Initialize Events by passing a hash.
 		 # Keys could be any GA allowed parameter.
 		 # Please refer Measurement Protocol Parameter Reference for available options:
 		 # https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters

 		 # As per Measurement Protocol, parameters: v, tid, cid and t should always be present.
 		 # This gem automatically injects v. Ensure you always pass tid, cid and t while
 		 # initializing events.
 		 def initialize(hash = {})
  			 @params = hash.select { |_k, v| v }
  			 @params['v'] = 1
  		end

 		 def payload
  			 URI.encode_www_form(@params)
  		end
 	end
end
