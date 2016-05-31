class OrdersController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    if params[:notice] != nil
      flash[:notice] = params[:notice]
    end
    @orders = Order.where('user_id = :id', {:id  => current_user.id})
  end
  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])
    respond_to do |format|
      format.html
      format.json
    end
  end

  # GET /orders/new
  def new
    @order = Order.new()
    @order.orders_products.build
  end

  # GET /orders/1/edit
  def edit
  end


  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @order.user_id=current_user.id
    respond_to do |format|
      if @order.save


        format.html { redirect_to @order, notice: 'Order created Successfully' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    OrdersProduct.delete(params[:id])
    respond_to do |format|
      if @order.update(order_params)


        format.html { redirect_to @order, notice: 'Order updated Successfully' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /_orders/1.json
  def destroy
    begin
      OrdersProduct.delete(params[:id])
      @order.destroy
      respond_to do |format|
        format.html { redirect_to orders_url, notice: 'Order destroyed Successfully' }
        format.json { head :no_content }
      end
    rescue Exception => e
      respond_to do |format|
        format.html { redirect_to orders_url, alert: 'Order wasnt destroy' }
        format.json { head :no_content }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def order_params
    params.require(:order).permit(:date, :user_id,:orders_products_attributes => [:product_id, :order_id, :code,:amount, :_destroy])
  end
end
