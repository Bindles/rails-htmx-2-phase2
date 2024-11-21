class CreateQcolors < ActiveRecord::Migration[7.1]
  def change
    create_table :qcolors do |t|
      t.string :name
      t.string :value

      t.timestamps
    end
  end
end
