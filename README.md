# lita-uptimerobot [![Gem Version](https://badge.fury.io/rb/lita-uptimerobot.svg)](http://badge.fury.io/rb/lita-uptimerobot)

**lita-uptimerobot** is a handler for [Lita](https://www.lita.io) that gives your bot commands for retrieving monitor statuses and uptime ratios from [uptimerobot.com](https://uptimerobot.com)

## Installation

Add lita-uptimerobot to your Lita instance's Gemfile:

``` ruby
gem "lita-uptimerobot"
```

## Configuration

### Required attributes

* `api_key` (String) – Your master API key from your uptimerobot.com dashboard.

### Example

``` ruby
Lita.configure do |config|
    config.handlers.uptimerobot.api_key= ENV["UPTIME_API_KEY"]
end
```

## Usage

Commands are called in the with the `uptime` prefix what can be optionally with the `upt` abbreviation. There's no need to prefix the command with your bot name.

```shell
uptime mysite (displays uptime and status for a monitor that matches)
upt all (displays uptime and statuses for all configured monitors)
upt example.com 15d (displays status and uptime for example.com where uptime is averaged over 15 days)
```

## License

[MIT](http://opensource.org/licenses/MIT)
