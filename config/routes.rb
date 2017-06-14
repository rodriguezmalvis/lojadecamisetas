Rails.application.routes.draw do
	resources :produtos, only: [:new, :create, :destroy]
	get "/produtos/busca" => "produtos#busca", as: :busca_produto
	root "produtos#index"
	#get "/produtos/new" => "produtos#new"
	#delete "/produtos/:id" => "produtos#destroy", as: :produto
	#post "/produtos" => "produtos#create"
end
