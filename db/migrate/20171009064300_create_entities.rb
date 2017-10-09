class CreateEntities < ActiveRecord::Migration[5.0]
  def change
    create_table :entities do |t|
      t.text :content
      t.integer :model_id

      t.timestamps
    end
  end
end
