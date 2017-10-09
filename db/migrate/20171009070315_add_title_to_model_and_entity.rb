class AddTitleToModelAndEntity < ActiveRecord::Migration[5.0]
  def change
    add_column :models, :title, :string
    add_column :entities, :title, :string
  end
end
