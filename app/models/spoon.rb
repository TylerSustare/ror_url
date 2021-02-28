class Spoon
  include Aws::Record

  set_table_name ENV['TABLE_NAME'] # good practice for testing
  string_attr :pk, hash_key: true
  string_attr :sk, range_key: true
  string_attr :type
  boolean_attr :active, database_attribute_name: 'is_active_flag'
  # Super neat. But the most idiomatic ruby would most likely be to have each field be a `<type_attr`.
  # Since most ruby code doesn't deal with nested hashes in models
  map_attr :attrs

  def active?
    active
  end

  def attributes
    # TODO: ||= memoize if model is clean?
    SpoonAttributes.new(attrs)
  end
end
