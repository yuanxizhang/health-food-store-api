class Api::V1::ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]

  # GET /products
  def index
    @products = Product.all.order(name: :ASC)
    render json: @products
  end

  # GET /products/:id
  def show
    render json: @product
  end

   # POST /products
  def create
    @product = Product.new(product_params)

    if @product.save
      render json: @product, status: :created, location: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PUT /products/:id
  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /products/:id
  def destroy
    @product.destroy
  end

  private

  def product_params
    params.require(:product).permit(:name, :brand, :description, :instock)
  end

  def set_product
    @product = Product.find_by(id: params[:id])
  end
end
