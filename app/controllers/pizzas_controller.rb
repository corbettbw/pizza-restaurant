class PizzasController < ApplicationController
  before_action :set_pizza, only: %i[show edit update destroy]

  def index
    @pizzas = Pizza.all
  end

  def show
  end

  def new
    @pizza = Pizza.new
    @toppings = Topping.all
  end

  def create
    @pizza = Pizza.new(pizza_params)
    if @pizza.save
      redirect_to pizzas_path, notice: "Pizza created successfully!"
    else
      @toppings = Topping.all
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @toppings = Topping.all
  end

  def update
    if @pizza.update(pizza_params)
      redirect_to pizzas_path, notice: "Pizza updated successfully!"
    else
      @toppings = Topping.all
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @pizza = Pizza.find(params[:id])
    @pizza.destroy
    redirect_to pizzas_path, notice: "Pizza deleted successfully!"
  end

  private

  def set_pizza
    @pizza = Pizza.find(params[:id])
  end

  def pizza_params
    params.require(:pizza).permit(:name, topping_ids: [])
  end
end
