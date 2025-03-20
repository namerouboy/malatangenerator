class MalatanController < ApplicationController
  def index
    @syokuzai = Syokuzai.all
  end

  def search
    @syokuzai = Syokuzai.where(name: params[:syokuzai.name])
    render "/malatan/result"
  end

end
