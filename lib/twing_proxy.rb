require 'twing_proxy/version'
require 'twing_proxy/proxy'

Twing.on_init do |app|
  app.cli.initializer.add(:proxy, '--proxy', 'start proxy') do
    app.receivers.add(Proxy)
  end
end
