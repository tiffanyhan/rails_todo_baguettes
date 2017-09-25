class TodosController < ApplicationController
  def index
    @todos = Todo.all # todo: partition by completeness, due date
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
