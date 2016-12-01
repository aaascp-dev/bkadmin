class ExtraTypesController < ApplicationController
  def index
    @extra_type = ExtraType.new
    @types = ExtraType.order("LOWER(name)").all
  end

  def create
    @extra_type = ExtraType.new(extra_type_params)
    if @extra_type.save
      flash[:success] = "Salvo com sucesso"
      redirect_to extra_types_path
    else
      @types = ExtraType.order("LOWER(name)").all
      render :index
    end
  end

  def edit
    @extra_type = ExtraType.find(params[:id])
    respond_to do |format|
      format.html { render :layout => false }
    end
  end

  def update
    @extra_type = ExtraType.find(params[:id])
    if @extra_type.update_attributes(extra_type_params)
      flash[:success] = "Atualizado com sucesso"
      redirect_to extra_types_path
    else
      @types = ExtraType.order("LOWER(name)").all
      render :index
    end
  end

  def destroy
    ExtraType.find(params[:id]).destroy
    redirect_to extra_types_path
  end

  private

    def extra_type_params
      params.require(:extra_type).permit(:name)
    end
end
