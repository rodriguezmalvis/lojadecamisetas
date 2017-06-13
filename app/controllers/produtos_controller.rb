class ProdutosController < ApplicationController

	def index
		@produtos_por_nome = Produto.order(:nome)
		@produtos_por_preco = Produto.order(preco: :desc).limit 4
	end

	def create
		valores = params.require(:produto).permit(:nome, :descricao, :quantidade, :preco)
		Produto.create valores
	end
end