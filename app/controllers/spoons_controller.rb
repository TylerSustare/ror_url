class SpoonsController < ApplicationController
  def index
    nan_pk = Nanoid.generate
    nan_sk = Nanoid.generate

    local_client = Aws::DynamoDB::Client.new(region: 'local', endpoint: 'http://localhost:8000')
    Spoon.configure_client(client: local_client)
    item = Spoon.new(pk: nan_pk,
                     sk: nan_sk,
                     type: 'spoon',
                     active: true,
                     attrs: SpoonAttributes.new(a: nan_pk[1..8], b: nan_sk[3..5]))
    item.save

    @nano = Spoon.find(pk: nan_pk, sk: nan_sk).attributes.concatter
  end
end
