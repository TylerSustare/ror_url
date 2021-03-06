class Mutations::CreateSpoon < Mutations::BaseMutation
  argument :type, String, required: true
  argument :active, Boolean, required: true

  field :spoon, Types::SpoonType, null: true # can return nil
  field :errors, [String], null: false

  def resolve(type:, active:)
    nan_pk = Nanoid.generate
    nan_sk = Nanoid.generate

    spoon = Spoon.new(
      pk: nan_pk,
      sk: nan_sk,
      type: 'spoon',
      active: true,
      attrs: SpoonAttributes.new(a: nan_pk[1..8], b: nan_sk[3..5])
    )

    begin
      spoon.save
      { spoon: spoon, errors: [] }
    rescue StandardError => e
      { spoon: nil, errors: [e.message] }
    end
  end
end
