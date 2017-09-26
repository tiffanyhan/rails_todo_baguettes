class TodosController < ApplicationController
  before_action :require_login, only: [:show, :new, :create, :edit, :update, :destroy]
  before_action :find_todo, only: [:show, :edit, :update, :destroy]

  def index
    if logged_in?
      @incomplete_todos = Todo.where(completed: false, user_id: current_user.id).order(due_date: :asc)
      @complete_todos = Todo.where(completed: true, user_id: current_user.id).order(due_date: :asc)
    end
  end

  def show
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = current_user.todos.build(todo_params)
    if @todo.save
      flash[:notice] = "You are getting baguettes"
      redirect_to todos_path
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @todo.update(todo_params)
      flash[:notice] = "You added jelly to your baguette"
      redirect_to todos_path
    else
      render "edit"
    end
  end

  def destroy
    if @todo.destroy
      flash[:notice] = "You destroyed your sandwich"
      redirect_to todos_path
    else
      flash[:notice] = "Generic error call Jay to fix."
      redirect_to todos_path
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :description, :due_date, :completed, :user_id)
  end

  def find_todo
    @todo = Todo.find_by(id: params[:id], user_id: current_user.id)
    if !@todo
      flash[:error] = "What do you think you're doing -- I saw that."
      redirect_to root_path
    end
  end
end
