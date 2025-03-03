class ToppingsController < ApplicationController
  before_action :set_topping, only: [:edit, :update, :destroy]

  def index
    @toppings = Topping.all.order(:name)
  end

  def new
    @topping = Topping.new
  end

  def create
    @topping = Topping.new(topping_params)
    if @topping.save
      redirect_to toppings_path, notice: "Topping was successfully added!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # This must exist to avoid the error
  end

  def update
    if @topping.update(topping_params)
      redirect_to toppings_path, notice: "Topping was successfully updated!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @topping.destroy
    redirect_to toppings_path, notice: "Topping was removed."
  end

  private

  def set_topping
    @topping = Topping.find(params[:id])
  end

  def topping_params
    params.require(:topping).permit(:name, :emoji)
  end
end
