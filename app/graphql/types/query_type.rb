module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :spoons, [Types::SpoonType], null: false
    field :spoon, Types::SpoonType, null: false do
      argument :pk, ID, required: true
      argument :sk, ID, required: true
    end

    def spoons
      Spoon.scan.map
    end

    def spoon(pk:, sk:)
      Spoon.find(pk: pk, sk: sk)
    end
  end
end
