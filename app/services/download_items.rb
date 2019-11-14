# frozen_string_literal: true

require 'uri'

class DownloadItems
  def initialize(client)
    @client = client
  end

  def call
    sync = @client.sync(initial: true)
    items = []
    sync.each_item do |item|
      items << item.raw
    end

    items = items.sort_by { |item| item['sys']['createdAt'] }

    Product.create(sys: { "type": 'Array' }, # sorry!
                   items: items,
                   nextSyncUrl: next_sync(sync.next_sync_url))
  end

  private

  def next_sync(url)
    uri = URI.parse(url)
    params = CGI.parse(uri.query)
    params['sync_token'].first
  end
end
