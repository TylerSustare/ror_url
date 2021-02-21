class SpoonsController < ApplicationController
  def index
    @nano = Nanoid.generate
  end
end
