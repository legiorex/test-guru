class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name, limit: 30
      t.string :last_name, limit: 30
      t.text :email

      t.timestamps
    end
  end
end
