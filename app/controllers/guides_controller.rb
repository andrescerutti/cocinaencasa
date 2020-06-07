class GuidesController < ApplicationController
  before_action :set_guide, only: [:show, :edit, :update]

  def show
    @kit = @guide.kit
    @review = Review.new
    @step = Step.new
  end

  def new
    @guide = Guide.new(params)
  end

  def create
  end

  def edit
  end

  def update
  end

  private

  def set_guide
    @guide = Kit.friendly.find(params[:id]).guide
    authorize @guide
  end

  def guide_params
    params.require(:guides).permit(:video)
  end
end
