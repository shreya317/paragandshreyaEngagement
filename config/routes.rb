Rails.application.routes.draw do
  get 'welcome/index'
  get 'address/index'
  get '/guests' => 'guests#index'
  post '/guests/:id' => 'guests#create'
  get '/guests/retrieve_guest' => 'guests#retrieve_guest'
  get '/guests/:id' => 'guests#show'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'mailinglist#index'
  root 'welcome#index'

end
