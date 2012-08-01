Erlymob::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)
  
  match '/about' => 'info#about', :as => 'about'
  match '/team' => 'info#team', :as => 'team'

  match '/login' => 'authentication#login', :as => 'login'
  match '/post_login' => 'authentication#post_login', :as => 'post_login'
  match '/logout' => 'authentication#logout', :as => 'logout'

  match '/like/:id' => 'mob#like', :as => 'like', :defaults => {:format => :json}
  match '/unlike/:id' => 'mob#unlike', :as => 'unlike', :defaults => {:format => :json}
  match '/rsvp/:id' => 'mob#rsvp', :as => 'rsvp', :defaults => {:format => :json}
  match '/unrsvp/:id' => 'mob#unrsvp', :as => 'unrsvp', :defaults => {:format => :json}

  root :to => 'index#index', :as => 'home'

end
