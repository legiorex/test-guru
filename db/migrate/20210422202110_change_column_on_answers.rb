class ChangeColumnOnAnswers < ActiveRecord::Migration[6.1]
  def change
    remove_column(:answers, :correct)
    add_column(:answers, :correct, :boolean)
  end
end
