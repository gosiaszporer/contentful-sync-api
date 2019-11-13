# frozen_string_literal: true

Rails.application.routes.draw do
  get 'synchronizations/download' => 'synchronizations#download'
  get 'synchronizations/sync' => 'synchronizations#sync'
  get 'synchronizations/reset' => 'synchronizations#reset'
  get 'products/index' => 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
