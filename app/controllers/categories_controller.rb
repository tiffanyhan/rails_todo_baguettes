class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.build category_params

    if @category.save
      flash[:notice] = "Now we're bakin'!!"
      redirect_to root_path
    else
      flash.now[:error] = "Ooops..."
      render :new
    end
  end

  def show
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end