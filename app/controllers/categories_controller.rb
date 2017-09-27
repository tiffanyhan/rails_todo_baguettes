class CategoriesController < ApplicationController
  before_action :require_login, only: [:new, :create, :show]
  before_action :correct_user, only: [:show]

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
    @category = Category.find(params[:id])
    @incomplete_todos = @category.todos.where(completed: false, user_id: current_user.id).order(due_date: :asc)
    @complete_todos = @category.todos.where(completed: true, user_id: current_user.id).order(due_date: :asc)
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def correct_user
    if Category.find(params[:id]).user != current_user
      flash[:error] = "You went the wrong way. Authorized employees only."
      redirect_to root_path
    end
  end
end
