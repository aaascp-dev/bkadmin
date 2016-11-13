class GlassTypesController < ApplicationController
  def new
    @glass_type = GlassType.new
    @types = GlassType.all
  end

  def create
    @glass_type = GlassType.new(glass_type_params)
    respond_to do |format|
      if @glass_type.save
        format.js { head :ok }
        #format.html { redirect_to @glass_type, notice: 'Tipo adicionado.' }
        #format.json { render json: @glass_type, status: :created, location: @glass_type }
      else
        format.js { head :nok }
        #format.html { render action: "new" }
        #format.json { render json: @glass_type.errors, status: :unprocessable_entity }
      end
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
