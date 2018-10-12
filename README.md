[![Gem Version](https://badge.fury.io/rb/gaevents.svg)](https://badge.fury.io/rb/gaevents)

# Gaevents

This gem allows you to update multiple background events in one go (via batches). Unlike other gems you do not need to load a js file to send events. Gaevents leverage GA's Measurement Protocol to send the events.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'gaevents'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gaevents

## Usage

Please refer [Measurement Protocol Parameter Reference](https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters) for the list of all parameters accepted by the Protocol.

The following parameters are required in each event:
`v`, `tid`, `cid` and `t`. This gem automatically injects `v`, make sure all events have `tid`, `cid` and `t` as parameters.

```
events = []
10.times { |n|
	events << GAEvents::Event.new({tid: GATRACKINGID, cid: "ci#{n}", t: 'event', ec: "video#{n}", ea: "abc#{n}", uid: "user#{n}"})
}
GAEvents.track(events)
```

## Migrating from 0.x to 1.x

In 0.x versions events were restricted to accepting only 5 parameters: `cid`, `ec`, `ea`, `el` and `ev` in the same order. Example:
```
GAEvents::Event.new(GOOGLE_API_CLIENT_ID, "testcategory", "gaaction")
```
1.x now accepts a hash that can have any number of acceptable parameters. The above line of code then becomes:
```
GAEvents::Event.new({tid: GATRACKINGID, cid: GOOGLE_API_CLIENT_ID, ec: "testcategory", ea: "gaaction"})
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/singhshivam/gaevents. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

