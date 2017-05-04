require "uri"
require "net/http"
require 'json'
require 'thread'
require 'base64'

module Churnzero
  class Client
    require 'churnzero/async'
    extend Churnzero::Async

    BASE_URL = 'https://analytics.churnzero.net/i'

    def initialize(app_key: nil, async: true)
      @app_key = app_key || Churnzero.configuration.app_key
      @async = app_key || Churnzero.configuration.async

    end

    def post_request(url = BASE_URL, data, async)
      if async
        send_async(url, data)
      else
        Net::HTTP.post_form(::URI.parse(url), data)
      end
    end

    def send_async(url, data)
      w = Churnzero::Client.worker
      begin
        url << "\n"
        w.write JSON.dump(data.merge(url: BASE_URL ))
        1
      rescue Errno::EPIPE => e
        Churnzero::Client.dispose_worker w
        0
      end
    end
  end
end
