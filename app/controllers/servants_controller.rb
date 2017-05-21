class ServantsController < ApplicationController
  def index
    @servants = Servant.sorted.includes(:servant_class)
    @classes = ServantClass.with_servants.sorted
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

  def edit
    @servant_form = ServantForm.new(Servant.find(params[:id]))
    respond_to do |format|
      format.html { render :edit }
    end
  end

  def update
    @servant_form = ServantForm.new(servant_form_params.merge(id: params[:id]))
    respond_to do |format|
      if @servant_form.update
        format.html { redirect_to servants_url }
      else
        format.html { render :edit }
      end
    end
  end

  private

  def servant_form_params
    params.require(:servant_form).permit(:name, :id, :rarity, :servant_class, :avatar, :tag_list)
  end
end
