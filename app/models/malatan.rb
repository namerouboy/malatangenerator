class Malatan < ApplicationRecord
  has_many :malatan_syokuzais, dependent: :destroy
  has_many :syokuzais, through: :malatan_syokuzais
end