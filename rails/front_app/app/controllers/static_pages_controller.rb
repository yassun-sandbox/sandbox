class StaticPagesController < ApplicationController

  def home
    user1 = JsonApiClient.get_json(["users","1"], { a:1, b:2, c:3, d:4 })
    user2 = JsonApiClient.get_json(["users","2"])
    @view_json = JsonTransferService.execute(user1, user2)
  end

end

