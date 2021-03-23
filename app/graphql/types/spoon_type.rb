module Types
  class SpoonType < Types::BaseObject
    field :pk, ID, null: false
    field :sk, ID, null: false
    field :type, String, null: true
    field :random_number, Integer, null: true
    field :screaming_type, String, null: true
    # field :connected_thing, [Types::ConnectedThing], null: true

    def screaming_type
      # use `object` to get the entity from the class from :point_up:
      # like `object.posts.size` for an active record association from users to posts
      object.type.upcase
    end

    def random_number
      rand(100)
    end
  end
end
