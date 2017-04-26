class ServantsController < ApplicationController
  def index
    @servants = Servant.sorted.includes(:servant_class, :icons).map(&:serialize)
    @classes = ServantClass.with_servants.sorted.map(&:serialize)
    respond_to do |format|
      format.html { render :index }
    end
  end

  def show
    @servant = Servant.find(params[:id])
    respond_to do |format|
      format.html { render :show }
    end
  end

  def random
    @servant = Servant.sample.first
    respond_to do |format|
      format.html { render :show }
    end
  end
end
