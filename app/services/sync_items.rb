# frozen_string_literal: true

require 'uri'

class SyncItems
  def initialize(client)
    @client = client
  end

  def call
    sync = @client.sync(sync_token: product.nextSyncUrl)

    items = Product.first.items
    new_items = []

    sync.each_item do |item|
      new_items << item.raw
    end

    new_items = new_items.sort_by { |item| item['sys']['createdAt'] }
    items << new_items

    Product.update(items: items, nextSyncUrl: next_sync(sync.next_sync_url))
  end

  private

  def next_sync(url)
    uri = URI.parse(url)
    params = CGI.parse(uri.query)
    params['sync_token'].first
  end

  def product
    Product.first
  end
end
