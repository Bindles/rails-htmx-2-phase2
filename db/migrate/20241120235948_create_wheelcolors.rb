class CreateWheelcolors < ActiveRecord::Migration[7.1]
  def change
    create_table :wheelcolors do |t|
      t.string :name
      t.string :value

      t.timestamps
    end
  end
end
