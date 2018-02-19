class V1::CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.where(nil) #Get all categories
    @categories = @categories.show       (params[:show])        if params[:show].present?
    @categories = @categories.starts_with(params[:starts_with]) if params[:starts_with].present?
    
    render :index, status: :ok
  end

  def show
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      render :show, status: :created
    else
      render json: { errors: @category.errors.messages },
             status: :unprocessable_entity
    end
  end

  #TODO
  def update
    # respond_to do |format|
    #   if @category.update(category_params)
    #     format.html { redirect_to @category, notice: 'Category was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @category }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @category.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  #TODO
  def destroy
    # @category.destroy
    # respond_to do |format|
    #   format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
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
