class ProductsController < ApplicationController

	PRODUCTS = [
			{
				id: 1,
				price: 100,
				name: 'phone'
			},

			{
				id: 2,
				price: 250,
				name: 'watch'
			}
	]

	def index	
		@products = PRODUCTS
	end

	def show
		@product = PRODUCTS.find { |p| p[:id] === params[:id].to_i }
	end
end
