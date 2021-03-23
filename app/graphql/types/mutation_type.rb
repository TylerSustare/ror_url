module Types
  class MutationType < Types::BaseObject
    field :create_spoon, mutation: Mutations::CreateSpoon
  end
end
