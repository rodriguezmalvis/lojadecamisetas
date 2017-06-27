class ProdutosController < ApplicationController

	def index
		@produtos_por_nome = Produto.order(:nome)
		@produtos_por_preco = Produto.order(preco: :desc).limit 4
	end

	def create
		valores = params.require(:produto).permit(:nome, :descricao, :quantidade, :preco, :departamento_id)
		@produto = Produto.new valores

		if @produto.save
			flash[:notice] = "Produto inserido com sucesso!!!"
			redirect_to root_url
		else
			render :new
		end

	end

	def destroy
		id = params[:id]
		Produto.destroy id
		redirect_to root_url
	end

	def busca
		@nome = params[:nome]
		@produtos = Produto.where "nome like ?", "%#{@nome}%" 
	end

	def new
		@produto = Produto.new
		@departamentos = Departamento.all
	end

	def edit
		id = params[:id]
		@produto = Produto.find(id)
	end
end