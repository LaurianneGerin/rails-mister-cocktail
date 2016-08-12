class Ingredient < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :doses
  before_destroy :check_dose

  class CustomException < StandardError; end

  private

  def check_dose
    raise CustomException if Dose.any? { |d| d.ingredient == self }
  end

end
