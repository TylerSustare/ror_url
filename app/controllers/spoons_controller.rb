class SpoonsController < ApplicationController
  def index
    nan_pk = Nanoid.generate
    nan_sk = SecureRandom.uuid

    item = Spoon.new(pk: nan_pk,
                     sk: nan_sk,
                     type: 'spoon',
                     active: true,
                     attrs: SpoonAttributes.new(a: nan_pk[1..8], b: nan_sk[3..5]))
    item.save

    @nano = Spoon.find(pk: nan_pk, sk: nan_sk).attributes.concatter
  end
end
