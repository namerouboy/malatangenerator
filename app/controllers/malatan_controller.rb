class MalatanController < ApplicationController
  def index
    @soup = Syokuzai.where(category: "soup")
    @yasai = Syokuzai.where(category: "vegetables")
    @men = Syokuzai.where(category: "men")
    @nerimono = Syokuzai.where(category: "nerimono")
    @niku = Syokuzai.where(category: "meats")
    @sakana = Syokuzai.where(category: "seafoods")
    @sonota = Syokuzai.where(category: "sonota")
    @suuryou = Suuryou.all
  end

  def search
    if params[:syokuzais].blank? || params[:syokuzais].all? { |s| s[:name].blank? }
      flash[:alert] = "食材を選択してください"
      redirect_to action: :index
      return
    end

    @syokuzai = Syokuzai.search_by_names(search_params)
    @suuryous = search_params

    render "/malatan/result"
  end

  def search_params
    params.fetch(:syokuzais, []).map do |syokuzai|
      syokuzai.permit(:name, :suuryou)
    end
  end

end
