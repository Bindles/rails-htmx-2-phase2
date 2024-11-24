class Qcolor < ApplicationRecord
  before_validation :set_default_name_or_update_name

  private

  # Set default name on creation or update name when value changes
  def set_default_name_or_update_name
    if name.blank?
      self.name = value
    elsif name == value_was && value_changed?
      # If the name matches the old value and value changes, update the name
      self.name = value
    end
  end
end
