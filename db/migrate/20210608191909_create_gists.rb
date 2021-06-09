class CreateGists < ActiveRecord::Migration[6.1]
  def change
    create_table :gists do |t|
      t.references :user, foreign_key: true
      t.references :question, foreign_key: true
      t.string :gist_url, null: false
      t.timestamps
    end
  end
end
