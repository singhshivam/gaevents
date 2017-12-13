require "gaevents/version"
require "rest-client"
require_relative "gaevents/event"

class GAEvents
	BULK_URI = 'https://www.google-analytics.com/batch'.freeze
	COLLECT_URI = 'https://www.google-analytics.com/batch'.freeze

	class << self
		attr_accessor :api_key

		def send_event(event)
			resource = RestClient::Resource.new COLLECT_URI
			resource.post(track_body([event]), {:content_type => 'text/plain'})
		end

		def track(*events)
			# as per GA: A maximum of 20 hits can be specified per request
			# https://developers.google.com/analytics/devguides/collection/protocol/v1/devguide#batch
			res = []
			events.each_slice(20) { |_events|
				resource = RestClient::Resource.new BULK_URI
				res << resource.post(track_body(_events.compact), {:content_type => 'text/plain'})
			}
			res
		end

		def track_body(*events)
			events.flatten.map { |_event| _event.payload(api_key) }.join("\n")
		end
	end
end
