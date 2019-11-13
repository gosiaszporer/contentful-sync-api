# frozen_string_literal: true

class Product
  include Mongoid::Document
  field :sys, type: Object
  field :items, type: Object
  field :nextSyncUrl, type: String

  def as_json(options = {})
    attrs = super(options)
    attrs.except('_id', 'nextSyncUrl')
  end
end
