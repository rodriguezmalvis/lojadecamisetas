class ProdutosController < ApplicationController

	def index
		
		@produtos_por_nome = Produto.order(:nome).limit 5
		@produtos_por_preco = Produto.order(preco: :desc).limit 2

	end

end