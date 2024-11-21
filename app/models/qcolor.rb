class Qcolor < ApplicationRecord
  before_validation :set_default_name

  def set_default_name
    if name.blank?
      self.name = value
    end
  end
  
end
