class ItemsController < ApplicationController
  def index
  end

  def new
     @iteme = Iteme.new
  end

  private
  def iteme_params
    params.require(:iteme).permit(:content, :image).merge(user_id: current_user.id)
  end

end
