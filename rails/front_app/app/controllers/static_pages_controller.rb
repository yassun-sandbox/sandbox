class StaticPagesController < ApplicationController

  def home
    json = JsonApiClient.new.call
    @view_json = JsonTransferService.execute(json)
  end

end

