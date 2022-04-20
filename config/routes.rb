Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'home#show'
  get '/test_global_feature_flag', to: 'home#show_test_global_feature_flag'
end
