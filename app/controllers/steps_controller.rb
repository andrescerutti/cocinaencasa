class StepsController < ApplicationController
  before_action :set_guide, only: [:create, :update, :destroy]

  def show
  end

  def new
  end

  def create
    @step = Step.new(step_params)
    @step.guide = @guide
    return redirect_to @step.guide if @step.save
    @kit = @guide.kit
    @review = Review.new
    render "guides/show"
  end

  def edit
  end

  def update
    return redirect_to @step.guide if @step.update(step_params)
  end

  def destroy
    @guide = @step.guide
    @step.destroy
    redirect_to @guide
  end

  private

  def set_guide
    @guide = Guide.find(params[:guide_id])
    authorize @guide
  end

  def step_params
    params.require(:step).permit(:content, :order)
  end
end
