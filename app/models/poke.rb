class Poke < ApplicationRecord
  validates :category, presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 50}
  
  
end
