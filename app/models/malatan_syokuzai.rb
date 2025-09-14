class MalatanSyokuzai < ApplicationRecord
  belongs_to :malatan
  belongs_to :syokuzai
  validates :count, numericality: { greater_than: 0 }
end