Rails.application.routes.draw do
  get 'welcome/index'
  get 'address/index'
  get '/guests' => 'guests#index'
  get '/guests/retrieve_guest' => 'guests#retrieve_guest'

  match 'guests/:id' => 'guests#show', :via => :get
  match 'guests/:id' => 'guests#update_all', :as => :update_all, :via => :put

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'mailinglist#index'
  # root 'welcome#index'
  root 'guests#index'

end
