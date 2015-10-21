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
    @cat = Cat.new
    render :new
  end

  def create
    @cat = Cat.new(cat_params)
    @cat.user_id = current_user.id

    if @cat.save
      redirect_to(cat_url(@cat))
    else
      render json: "Save failed.", status: :unprocessable_entity
    end
  end

  def edit
    @cat = Cat.find(params[:id])
    render :edit
  end

  def update

    @cat = current_user.cats.find(params[:id])

    if !@cat.nil? && @cat.update(cat_params)
      redirect_to(cat_url(@cat))
    else
      flash[:errors] = @cat.errors.full_messages.to_s
      redirect_to(edit_cat_url(@cat))
    end
  end

  private
    def cat_params
      params.require(:cat).permit(:birthdate, :color, :name, :sex, :description)
    end

end
