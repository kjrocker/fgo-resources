class ServantsController < ApplicationController
  def index
    @servants = Servant.all.includes(:servant_class)
    respond_to do |format|
      format.html { render :index }
    end
  end
end
