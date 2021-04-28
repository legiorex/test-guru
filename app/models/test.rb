class Test < ApplicationRecord
  def self.by_category(category_name)
    order('tests.id DESC').joins('INNER JOIN categories ON tests.category_id = categories.id').where('categories.title' => category_name).pluck(:title)
  end

end
