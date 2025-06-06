class Malatan < ApplicationRecord
  has_many :malatan_syokuzais, dependent: :destroy
  has_many :syokuzais, through: :malatan_syokuzais

  def total_calorie
    malatan_syokuzais.includes(:syokuzai).sum do |ms|
      ms.syokuzai.calorie.to_i * ms.count.to_i
    end
  end
  
  def total_weight
    malatan_syokuzais.includes(:syokuzai).sum do |ms|
      ms.syokuzai.weight.to_i * ms.count.to_i
    end
  end

end