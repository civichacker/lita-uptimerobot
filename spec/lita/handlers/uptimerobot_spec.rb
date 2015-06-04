require "spec_helper"

describe Lita::Handlers::Uptimerobot, lita_handler: true do
  it { is_expected.to route_command('uptime all').to(:uptime) }
  it { is_expected.to route_command('upt example.com').to(:uptime) }
  it { is_expected.to route_command('uptime 7 days').to(:uptime) }
  it { is_expected.to route_command('uptime mysite 17 days').to(:uptime) }
  it { is_expected.to route_command('upt mysite 17d').to(:uptime) }
end
