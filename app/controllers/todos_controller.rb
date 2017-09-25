class TodosController < ApplicationController
  def index
    @todos = Todo.all # todo: partition by completeness, due date
  end

  def show
  end

  def new
    @todo = Todo.new
  end

  def create
    byebug
    @todo = Todo.new
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def todo_params
  end
end
