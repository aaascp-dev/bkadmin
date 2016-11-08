class GlassTypesController < ApplicationController
  def new
    @glass_type = GlassType.new
    @types = GlassType.all
  end

  def create
    @glass_type = GlassType.new(glass_type_params)
    if @glass_type.save
      redirect_to :action => "new"
    else
      @types = GlassType.all
      render "new"
    end
  end

  private

    def glass_type_params
      params.require(:glass_type).permit(:name)
    end
end
