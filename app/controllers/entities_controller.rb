class EntitiesController < ApplicationController
  before_action :set_entity, only: %i[show edit update destroy]

  # GET /entities or /entities.json
  def index
    @group = Group.find(params[:group_id])
    @entities = @group.entities.order(created_at: :desc)

  # GET /entities/new
  def new
    @group = Group.find(params[:group_id])
    @group = Group.where(user: current_user)
    @entity = Entity.new
  end

  # GET /entities/1/edit
  def edit; end

  # POST /entities or /entities.json
  def create
    @entity = Entity.new(entity_params)

    @entity.user = current_user
    @group = Group.find(params[:group_id])
    @group.entities << @entity
   
    if @entity.save
      redirect_to_group_entities_path(@group), notice: 'Your transaction has been added successfully'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # DELETE /entities/1 or /entities/1.json
  def destroy
    @entity.destroy

    respond_to do |format|
      format.html { redirect_to entities_url, notice: 'Entity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_entity
    @entity = Entity.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def entity_params
    params.fetch(:entity, {})
    params.require(:entity).permit(:name, :amount, :user_id)
  end
end
