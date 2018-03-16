class V1::CategoriesController < ApplicationController
  before_action :set_category, only: [:index, :update, :show]

  # GET /v1/categories
  def index
    @categories = Category.where(nil) #Get all categories
    @categories = @categories.show       (params[:show])        if params[:show].present?
    @categories = @categories.starts_with(params[:starts_with]) if params[:starts_with].present?
    
    render :index, status: :ok
  end

  # POST /v1/categories
  def create
    @category = Category.new(category_params)

    if @category.save
      render :show, status: :created
    else
      render json: { errors: @category.errors.messages },
             status: :unprocessable_entity
    end
  end

  # PATCH /v1/categories/:id
  def update
    if @category.update(category_params)
      render :show, status: :created
    else
      render json: { errors: @category.errors.messages },
             status: :unprocessable_entity
    end
  end

  # GET /v1/categories/:id
  def show
    render :show, status: :ok
  end

  # DELETE /v1/categories/:id
  def destroy
    @category.destroy

    render head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name, :show, :description)
    end
end
