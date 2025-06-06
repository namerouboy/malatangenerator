class MalatanResultsController < ApplicationController

 def index
    @malatans = Malatan.includes(malatan_syokuzais: :syokuzai).order(created_at: :desc)
  end

  def show
    @malatan = Malatan.find(params[:id])
  end

  def create
    @malatan = Malatan.new(name: params[:name])

  if @malatan.save
    params[:suuryous].each do |syokuzai_name, count|
      syokuzai = Syokuzai.find_by(name: syokuzai_name)
      next if syokuzai.nil? || count.to_i <= 0

      MalatanSyokuzai.create!(
        malatan: @malatan,
        syokuzai: syokuzai,
        count: count.to_i
      )
    end
    flash[:notice] = "レシピを保存しました！"
    redirect_back(fallback_location: root_path)
  else
    flash.now[:alert] = "レシピ名を入力してください"
    redirect_back(fallback_location: root_path)
  end
  end
end
