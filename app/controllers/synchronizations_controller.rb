# frozen_string_literal: true

require 'contentful'
require 'uri'

class SynchronizationsController < ApplicationController
  def download
    if Product.first
      return render json: { message: "Initial download alredy happened" },
                    status: :unprocessable_entity
    end

    sync = client.sync(initial: true)
    items = []
    sync.each_item do |item|
      items << item.raw
    end

    items = items.sort_by { |item| item['sys']['createdAt'] }

    Product.create(sys: { "type": 'Array' }, #sorry!
                  items: items, 
                  nextSyncUrl: next_sync(sync.next_sync_url))
  end

  def sync
    if Product.first.nil?
      return render json: { message: "You can't synchronize without initial download" },
                    status: :unprocessable_entity
    end

    sync = client.sync(sync_token: Product.first.nextSyncUrl)
    items = Product.first.items
    sync.each_item do |item|
      items << item.raw
    end

    Product.update(items: items, nextSyncUrl: next_sync(sync.next_sync_url))
  end

  def reset
    Product.destroy_all
    download
  end

  private

  def client
    Contentful::Client.new(
      space: Rails.application.credentials.contentful[:space],
      access_token: Rails.application.credentials.contentful[:access_token],
      environment: 'master',
      dynamic_entries: :auto
    )
  end

  def next_sync(url)
    uri = URI.parse(url)
    params = CGI.parse(uri.query)
    params['sync_token'].first
  end
end
