class CatsController < ApplicationController

  def index
    @cats = Cat.all

    render :index
  end

  def show
    @cat = Cat.find(params[:id])
    render :show
  end

  def edit
    @cat = Cat.find(params[:id])
    render :edit
  end

  def new
    @cat = Cat.new
    render :new
  end

  def create
    @cat = Cat.new(cat_params)

    if @cat.save!
      render :show
    else
      redirect_to new_cat_url
    end
  end

  private

  def cat_params
    params.require(:cat).permit(:color, :name, :sex, :birth_date, :description)
  end
end
