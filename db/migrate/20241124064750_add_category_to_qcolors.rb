class AddCategoryToQcolors < ActiveRecord::Migration[7.1]
  def change
    add_column :qcolors, :category, :string
  end
end
