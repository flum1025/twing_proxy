require 'twing/modules/base'
require 'rest-client'

class Proxy < Twing::Modules::Base
  def initialize(*args)
    super
    @endpoints = setting.endpoints
  end

  def on_message(object)
    case object
    when Twitter::Tweet
      logger.debug("Tweet #{object.id}")
      execute(object)
    end
  end

  private

  def execute(object)
    @endpoints.each do |endpoint|
      Thread.new do
        begin
          RestClient.post(
            endpoint,
            object.to_h.to_json,
            content_type: :json,
            accept: :json
          )
        rescue => e
          logger.error("#{e.class} #{e.message}")
        end
      end
    end
  end
end
