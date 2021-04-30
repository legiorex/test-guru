class User < ApplicationRecord
  def used_tests(level)
    Test.joins('INNER JOIN test_users ON tests.id = test_users.test_id').where('test_users.user_id' => id, 'tests.level' => level)
    # id
  end
end
