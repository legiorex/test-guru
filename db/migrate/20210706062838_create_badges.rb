class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :name, limit: 50, null: false
      t.string :file_name, limit: 50, null: false
      t.string :rule, null: false
      t.string :type_badge, null: false
      t.references :author, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
