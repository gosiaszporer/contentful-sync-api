# frozen_string_literal: true

require 'contentful'

class SynchronizationsController < ApplicationController
  def download
    if existing_record
      return render json: { message: 'Initial download alredy happened' },
                    status: :unprocessable_entity
    end

    DownloadItems.new(client).call
  end

  def sync
    if existing_record.nil?
      return render json: { message: "You can't synchronize without initial download" },
                    status: :unprocessable_entity
    end

    SyncItems.new(client).call
  end

  def reset
    Product.destroy_all
    DownloadItems.new(client).call
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

  def existing_record
    Product.first
  end
end
