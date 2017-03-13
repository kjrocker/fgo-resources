class ServantsController < ApplicationController
  def index
    @servants = Servant.sorted.includes(:servant_class).map(&:serialize)
    @classes = ServantClass.with_servants.sorted.map(&:serialize)
    respond_to do |format|
      format.html { render :index }
    end
  end
end
