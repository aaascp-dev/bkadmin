class GlassesController < AdminController
  def index
    @glasses = Glass.search(params[:search])
  end

  def new
    @glass = Glass.new
    @types = GlassType.order("LOWER(name)").all
    @providers = Provider.order("LOWER(name)").all
  end

  def create
    @glass = Glass.new(glass_params)
    if @glass.save
      flash[:success] = "Salvo com sucesso."
      redirect_to glasses_path
    else
      @types = GlassType.order("LOWER(name)").all
      @providers = Provider.order("LOWER(name)").all
      render :new
    end
  end

  def edit
    @glass = Glass.find(params[:id])
    @types = GlassType.order("LOWER(name)").all
    @providers = Provider.order("LOWER(name)").all
  end

  def update
    @glass = Glass.find(params[:id])
    if @glass.update_attributes(glass_params)
      flash[:success] = "Atualizado com sucesso."
      redirect_to glasses_path
    else
      @types = GlassType.order("LOWER(name)").all
      @providers = Provider.order("LOWER(name)").all
      render :edit
    end
  end

  def destroy
    if Glass.find(params[:id]).destroy
      flash[:success] = "Exlcuído com sucesso."
    else
      flash[:error] = "Falha ao excluir. Tente novamente."
    end
    redirect_to glasses_path
  end

  private
    def glass_params
      params.require(:glass).permit(
        :name,
        :volume,
        :glass_type_id,
        :provider_id,
        :price,
        :cost,
        :stock)
    end
end
