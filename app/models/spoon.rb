class Spoon
  include Aws::Record

  if ENV['RAILS_ENV'] != 'production'
    # Apparently doesn't need to be memoized b/c of Rails memory model 🤔
    local_client = Aws::DynamoDB::Client.new(region: 'local', endpoint: 'http://localhost:8000')
    configure_client(client: local_client)
  end

  set_table_name ENV['TABLE_NAME'] # good practice for testing
  string_attr :pk, hash_key: true
  string_attr :sk, range_key: true
  string_attr :type
  boolean_attr :active, database_attribute_name: 'is_active_flag'
  # Super neat. But the most idiomatic ruby would most likely be to have each field be a `<type>_attr`.
  # Since most ruby code doesn't __generally__ deal with nested hashes in models
  map_attr :attrs

  def active?
    active
  end

  def attributes
    # TODO: ||= memoize if model is clean?
    SpoonAttributes.new(attrs)
  end
end
