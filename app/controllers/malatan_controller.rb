class MalatanController < ApplicationController
  def index
    @soup = Syokuzai.where(category: "soup")
    @yasai = Syokuzai.where(category: "vegetables")
    @men = Syokuzai.where(category: "men")
    @nerimono = Syokuzai.where(category: "nerimono")
    @niku = Syokuzai.where(category: "meats")
    @sakana = Syokuzai.where(category: "seafoods")
    @sonota = Syokuzai.where(category: "sonota")
  end

  def search
    @syokuzai = Syokuzai.where(name: params[:syokuzai.name])
    render "/malatan/result"
  end

end
