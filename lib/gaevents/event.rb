class GAEvents
	class Event
		attr_accessor :client, :category, :action, :label, :value

		def initialize(client, category, action, label = nil, value = nil)
			@client = client
			@category = category
			@action = action
			@label = label
			@value = value
		end

		def params(tid)
			params = {
			"v" => 1,
			"tid" => tid,
			"cid" => @client,
			"t" => "event",
			"ec" => @category,
			"ea" => @action,
			"el" => @label,
			"ev" => @value
			}
			params.reject! { |k,v| !v }
		end

		def payload(tid)
			URI.encode_www_form params(tid)
		end
	end
end
