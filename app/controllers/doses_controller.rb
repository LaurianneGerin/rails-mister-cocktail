class DosesController < ApplicationController
  before_action :find_cocktail, only: [:create]

  def create
    @dose = @cocktail.doses.new(dose_params)
    if @dose.save
      redirect_to cocktails_path(@cocktail)
    else
      render 'cocktails/show'
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:id, :cocktail_id, :description, :ingredient_id)
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

end
