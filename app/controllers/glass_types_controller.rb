class GlassTypesController < AdminController
  def index
    @glass_type = GlassType.new
    @types = GlassType.order("LOWER(name)").all
  end

  def create
    @glass_type_to_save = GlassType.new(glass_type_params)
    if @glass_type_to_save.save
      redirect_to glass_types_path
    else
      redirect_to glass_types_path
    end
  end

  def destroy
    GlassType.find(params[:id]).destroy
    redirect_to glass_types_path
  end

  def update
    @glass_type = GlassType.find(params[:id])
    if @glass_type.update_attributes(glass_type_params)
      redirect_to glass_types_path
    else
      redirect_to glass_types_path
    end
  end

  private

    def glass_type_params
      params.require(:glass_type).permit(:name)
    end
end
