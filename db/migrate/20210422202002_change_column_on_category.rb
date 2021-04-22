class ChangeColumnOnCategory < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:categories, :title, false)
  end
end
