require 'test_helper'

class SpoonsControllerTest < ActionDispatch::IntegrationTest
  test 'the truth' do
    local_client = Aws::DynamoDB::Client.new(region: 'local', endpoint: 'http://localhost:8000')

    Spoon.configure_client(client: local_client)
    before = Spoon.scan.each.count
    get root_path
    after = Spoon.scan.each.count
    assert_equal(before + 1, after)
  end
end
