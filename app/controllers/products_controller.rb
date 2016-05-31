# encoding: UTF-8
class ProductsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    if params[:notice] != nil
      flash[:notice] = params[:notice]
    end
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])
    respond_to do |format|
      format.html
      format.json
    end
  end

  # GET /products/new
  def new
    @product = Product.new

  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product created Successfully' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product updated Successfully' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    if OrdersProduct.isProduct(params[:id])<=0
      Product.deleteProduct(params[:id])
      respond_to do |format|
        format.html { redirect_to products_url, notice: 'Product destroyed Successfully' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to products_url, alert: 'Product wasnt destroy' }
        format.json { head :no_content }
      end
    end
  end

  def get_product
    @product = Product.find(params[:id])
    render json: @product
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params.require(:product).permit(:name, :sku, :price)
  end
end
