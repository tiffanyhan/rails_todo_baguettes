class CreateTodos < ActiveRecord::Migration[5.1]
  def change
    create_table :todos do |t|
      t.string :title
      t.text :description
      t.timestamp :due_date
      t.boolean :completed
      t.timestamps
    end
  end
end
