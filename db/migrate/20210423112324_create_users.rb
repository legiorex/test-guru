class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name, limit: 30, null: false
      t.string :last_name, limit: 30, null: false
      t.text :email, null: false

      t.timestamps
    end
  end
end
