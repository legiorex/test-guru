class AddTests < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:tests, :title, false)
    change_column_default(:tests, :level, from: nil, to: 0)
  end
end
