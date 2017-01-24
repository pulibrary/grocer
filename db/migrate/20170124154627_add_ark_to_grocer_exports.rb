class AddArkToGrocerExports < ActiveRecord::Migration[5.0]
  def change
    add_column :grocer_exports, :ark, :string
  end
end
