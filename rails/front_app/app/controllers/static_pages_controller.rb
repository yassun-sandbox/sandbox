class StaticPagesController < ApplicationController

  def home
    JsonTransferService.execute
  end

end
