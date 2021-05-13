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
      render json: @product, status: :created
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PUT /products/:id
  def update
    if @product.update(product_params)
      render json: @product
      if @product.instock < 1
        Notifier.out_of_stock_email(@product.id).deliver_now
      end
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  def increase_inventory(n)
    @product = Product.find_by(id: params[:id])
    @product.instock += n.to_i
    @product.save
  end
  
  def decrease_inventory(n)
    @product = Product.find_by(id: params[:id])
    if current_user.isadmin?
      @admin_user_id = current_user.id
    end
    
    if @product.instock > 1 && (@product.instock - n.to_i) > 1
      @product.instock -= n.to_i
    elsif @product.instock < 1
      Notifier.out_of_stock_email(@product.id).deliver_now
    end
    @product.save
  end

  private

  def product_params
    params.require(:product).permit(:name, :brand, :description, :instock)
  end

  def set_product
    @product = Product.find_by(id: params[:id])
  end
end
