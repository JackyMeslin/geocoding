class AddCategoryToMegalith < ActiveRecord::Migration[6.0]
  def change
    add_column :megaliths, :category, :string
  end
end
