class Syokuzai < ApplicationRecord

  has_many :malatan_syokuzais
  has_many :malatans, through: :malatan_syokuzais

  def self.search_by_names(name_params)
    name_hashes = name_params.map { |p| p.permit(:name).to_h }

    queries = name_hashes.map do |h|
      where(h)
    end

    queries.reduce(:or)
  end
end
