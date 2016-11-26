class GlassTypesController < AdminController
  def index
    @glass_type = GlassType.new
    @types = GlassType.order("LOWER(name)").all
  end

  def create
    @glass_type = GlassType.new(glass_type_params)
    if @glass_type.save
      flash[:success] = "Salvo com sucesso"
      redirect_to glass_types_path
    else
      @types = GlassType.order("LOWER(name)").all
      render :index
    end
  end

  def edit
    @glass_type = GlassType.find(params[:id])
    respond_to do |format|
      format.html { render :layout => false }
    end
  end

  def update
    @glass_type = GlassType.find(params[:id])
    if @glass_type.update_attributes(glass_type_params)
      flash[:success] = "Atualizado com sucesso"
      redirect_to glass_types_path
    else
      @types = GlassType.order("LOWER(name)").all
      render :index
    end
  end

  def destroy
    GlassType.find(params[:id]).destroy
    redirect_to glass_types_path
  end

  private

    def glass_type_params
      params.require(:glass_type).permit(:name)
    end
end
