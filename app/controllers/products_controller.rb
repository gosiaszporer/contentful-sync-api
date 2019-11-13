# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    product = Product.first

    render json: product
  end
end
