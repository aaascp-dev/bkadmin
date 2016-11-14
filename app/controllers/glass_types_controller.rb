class GlassTypesController < ApplicationController
  def index
    @glass_type = GlassType.new
    @types = GlassType.all
  end

  def create
    @glass_type_to_save = GlassType.new(glass_type_params)
    if @glass_type_to_save.save
      @glass_type = GlassType.new
      @types = GlassType.all
      render :index
    else
      @glass_type = GlassType.new
      @types = GlassType.all
      render :index
    end
  end

  def destroy
    GlassType.find(params[:id]).destroy
    #redirect_to :new
  end

  private

    def glass_type_params
      params.require(:glass_type).permit(:name)
    end
end
