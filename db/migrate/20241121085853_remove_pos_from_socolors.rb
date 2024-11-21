class RemovePosFromSocolors < ActiveRecord::Migration[7.1]
  def change
    remove_column :socolors, :pos, :integer
  end
end
