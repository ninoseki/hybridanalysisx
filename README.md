# hybridanalysisx

[![Gem Version](https://badge.fury.io/rb/hybridanalysisx.svg)](https://badge.fury.io/rb/hybridanalysisx)
[![Build Status](https://travis-ci.com/ninoseki/hybridanalysisx.svg?branch=master)](https://travis-ci.com/ninoseki/hybridanalysisx)
[![Coverage Status](https://coveralls.io/repos/github/ninoseki/hybridanalysisx/badge.svg?branch=master)](https://coveralls.io/github/ninoseki/hybridanalysisx?branch=master)
[![CodeFactor](https://www.codefactor.io/repository/github/ninoseki/hybridanalysisx/badge)](https://www.codefactor.io/repository/github/ninoseki/hybridanalysisx)

Yet another Hybrid Analysis API wrapper for Ruby.

## Installation

```bash
gem install hybridanalysisx
```

## Usage

```ruby
require "hybridanalysis"

# when given nothing, it tries to load your API key via ENV["HA_API_KEY"] or ENV["HYBRIDANALYSIS_API_KEY"]
api = HybridAnalysis::API.new
# or you can set it manually
api = HybridAnalysis::API.new(key: "YOUR_API_KEY")

api.feed.latest
api.quick_scan(file: "/tmp/foo.exe", scan_type: "all")
api.submit.file(file: "/tmp/foo.exe", environment_id: "110")
```

See [docs](https://www.rubydoc.info/gems/hybridanalysisx/) for more.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
