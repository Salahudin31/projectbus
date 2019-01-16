Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   namespace 'api'  do
  	namespace 'v1' do
		resources :buses
		resources :bangkus
		resources :jadwals
		resources :pesanan_tikets
		resources :rutes
	end  	
  end

  resources :users, param: :_username
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
end
