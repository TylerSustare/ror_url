require 'test_helper'

class SpoonsControllerTest < ActionDispatch::IntegrationTest
  test 'root path adds another spoon' do
    before = Spoon.scan.each.count
    get root_path
    after = Spoon.scan.each.count
    assert_equal(before + 1, after)
  end
end
