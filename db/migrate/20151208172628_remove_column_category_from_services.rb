class RemoveColumnCategoryFromServices < ActiveRecord::Migration
  def change
    remove_column :services, :category
  end
end
