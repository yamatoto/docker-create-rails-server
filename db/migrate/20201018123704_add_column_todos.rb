class AddColumnTodos < ActiveRecord::Migration[6.0]
  def change
    add_column :todos, :title, :string
    add_column :todos, :content, :string
    add_column :todos, :category_id, :integer
    add_column :todos, :post_user_id, :string
  end
end
