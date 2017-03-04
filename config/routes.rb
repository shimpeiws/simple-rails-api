Rails.application.routes.draw do
  match '*path' => 'options_request#preflight', via: :options
  post 'user_token' => 'user_token#create'
  jsonapi_resources :items
end
