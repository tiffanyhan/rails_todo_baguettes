class TodosController < ApplicationController
  def index
    @todos = Todo.all # todo: partition by completeness, due date
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      flash[:notice] = "You are getting baguettes" # todo fix this
      redirect_to todos_path
    else
      render "new"
    end
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update(todo_params)
      flash[:notice] = "You added jelly to your baguette"
      redirect_to todo_path(@todo)
    else
      render "edit"
    end
  end

  def destroy
    
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :description, :due_date)
  end
end
