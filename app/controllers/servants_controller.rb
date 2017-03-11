class ServantsController < ApplicationController
  def index
    @servants = Servant.all.includes(:servant_class).map(&:serialize)
    @classes = ServantClass.all
    respond_to do |format|
      format.html { render :index }
    end
  end
end
