Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations' }
  # The code after :users, tells devise to look at our custom controller for
  # handling registrations and updates to user registrations.

  root 'posts#index'
  # Specifies what Rails should route '/' to using the 'root' method.
  resources :posts
  # Includes the SEVEN customary routes for your application.  In Rails there is
  # 'resourceful' routing that maps HTTP verbs and URLs to controller actions,
  # which in turn map to a specific CRUD operation in a database, e.g.
  # http://guides.rubyonrails.org/routing.html#resource-routing-the-rails-default

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
