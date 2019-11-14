# frozen_string_literal: true

Rails.application.routes.draw do
  get 'synchronizations/download' => 'synchronizations#download'
  get 'synchronizations/sync' => 'synchronizations#sync'
  get 'synchronizations/reset' => 'synchronizations#reset'
  get 'products/index' => 'products#index'

  mount Apidoco::Engine, at: "/docs"
end
