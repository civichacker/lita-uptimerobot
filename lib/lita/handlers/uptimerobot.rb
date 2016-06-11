require 'json'
module Lita
  module Handlers
    class Uptimerobot < Handler

      config :api_key, required: true

      @status = {
        '0' => 'paused',
        '1' => 'not checked',
        '2' => 'up',
        '8' => 'seems down',
        '9' => 'down',
      }

      def self.status(key)
        @status[key]
      end

      route /^upt(?:ime)?(?:\s([a-z\.\-\d]+))?(?:\s(\d+)\s?d(?:ays)?)?$/i, :uptime, command: false, help: {
        'uptime all' => 'get default uptime ratios and statuses for all monitors',
        'uptime piwik' => 'get uptime for matching friendly name',
        'uptime example.com' => 'get uptime for given URL'
      }

      def uptime(msg)
        what = msg.matches.flatten.first
        span = msg.matches.flatten[1]
        r = ''
        response = http.get("https://api.uptimerobot.com/getMonitors") do |req|
          req.params['apiKey'] = config.api_key
          req.params['format'] = "json"
          req.params['noJsonCallback'] = "1"

          req.params['search'] = what unless what.nil? or what == 'all'
          req.params['customUptimeRatio'] = span unless span.nil?
        end
        result = JSON.parse(response.body)
        max_ratio_width = "uptime %".length
        max_url_width = 0
        max_status_width = self.class.status("1").length
        result['monitors']['monitor'].each do |monitor|
          max_url_width = monitor['url'].length if monitor['url'].length > max_url_width
          r << "#{monitor['alltimeuptimeratio'].center(max_ratio_width)}\t"
          r << "#{self.class.status(monitor['status']).center(max_status_width)}\t"
          r << "#{monitor['friendlyname']}\t"
          r << "#{monitor['url']}\n"
        end
        header = ''
        header << "Uptime %\t" << "Status".center(max_status_width) << "\tName\t" << "URL".center(max_url_width) << "\n"
        msg.reply header << r
      end
    end

    Lita.register_handler(Uptimerobot)
  end
end
