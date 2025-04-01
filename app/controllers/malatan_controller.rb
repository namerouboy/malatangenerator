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

      queries = params[:syokuzais].map do |syokuzai|
      Syokuzai.where(syokuzai.permit(:name).to_h)
    end
  
    # 複数の where 条件を OR で結合
    @syokuzai = queries.reduce(:or)

    @suuryous = params[:syokuzais] || []


    render "/malatan/result"

    @syokuzai = Syokuzai.where(name: params[:syokuzai.name])
    @kazu = params[:kazu]
    render "/malatan/rsult"

  end

end
