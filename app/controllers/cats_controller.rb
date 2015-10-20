class CatsController < ApplicationController

  def index
    @cats = Cat.all

    render :index
  end

  def show
    @cat = Cat.find(params[:id])

    render :show
  end

  def new
    render :new
  end

  def create
    @cat = Cat.new(cat_params)

    if @cat.save
      redirect_to(controller: :cats, action: :show, id: @cat.id)
    else
      render json: "Save failed.", status: :unprocessable_entity
    end
  end

  private
    def cat_params
      params[:cat].permit(:birthdate, :color, :name, :sex, :description)
    end

end
