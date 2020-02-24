class LessonsController < ApplicationController
  before_action :load_lesson, only: %i(show edit update)

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new lesson_params
    @success = @lesson.save
    if @success
      flash[:success] = "Create lesson success";
      redirect_to lesson_path(@lesson)
    end
  end

  def index
    @lessons = Lesson.newest.page(params[:page]).per Settings.lesson.per_page
  end

  def show
  end

  def edit
  end

  def update
    @success = @lesson.update lesson_params
    if @success
      flash[:success] = "Update lesson success";
      redirect_to lesson_path(@lesson)
    end
  end

  private

  def load_lesson
    @lesson = Lesson.find_by id: params[:id]
    return if @lesson

    flash[:danger] = "Lesson not found"
    redirect_to root_url
  end

  def lesson_params
    params.require(:lesson).permit :name, :description, :document
  end
end
