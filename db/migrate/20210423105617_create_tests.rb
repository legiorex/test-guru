class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.string :title, limit: 50, null: false
      t.integer :level, default: 0
      t.references :category
      t.timestamps
    end
  end
end
