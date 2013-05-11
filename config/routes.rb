RankingFood::Application.routes.draw do

  resources :fooditems

  resource :shared, :only => [:edit], :controller => 'shared'

  get "home/index"

  root :to => 'Home#index'

end
