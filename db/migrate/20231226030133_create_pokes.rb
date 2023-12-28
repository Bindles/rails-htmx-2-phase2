class CreatePokes < ActiveRecord::Migration[7.1]
  def change
    create_table :pokes do |t|
      t.string :name
      t.string :url
      t.string :category

      t.timestamps
    end
  end
end
