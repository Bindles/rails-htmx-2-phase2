class CreatePos < ActiveRecord::Migration[7.1]
  def change
    create_table :pos do |t|
      t.string :name
      t.string :url

      t.timestamps
    end
  end
end
