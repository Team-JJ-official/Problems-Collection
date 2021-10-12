class ProblemsController < ApplicationController
  def index
  end

  def show
    @problem = Problem.find_by(params[:id])
    if @problem.nil?
      flash[:danger] = "存在しない問題です"
      redirect_to root_path
    end
  end

  def new
    @problem = Problem.new
  end

  def create
    if @problem = Problem.create(problem_params)
      update_alternatives
      @problem.update(answer: @problem.alternatives[params[:problem][:answer].to_i])
      flash[:success] = "{ジャンル：#{@problem.genre}} 問題を作成しました"
      redirect_to root_path
    else
      flash.now[:danger] = "不正な項目があります"
      render "new"
    end
  end

  def edit
    if (@problem = Problem.find_by(id: params[:id])).nil?
      flash[:warning] = "存在しないIDです"
      redirect_to root_path
    end
  end

  def update
    if @problem = Problem.find_by(id: params[:id])
      if @problem.update(problem_params)
        flash[:success] = "問題を更新しました"
      else
        flash.now[:danger] = "不正な項目があります"
        render "edit"
      end
    end
  end

  private
  def problem_params
    params.require(:problem)[:problem_type] ||= ProblemType.first
    params.require(:problem).permit(:sentence, :explanation, :genre, :problem_type_id)
  end

  def update_alternatives
    @problem.alternatives.destroy_all
    params[:alternatives].each do |alt|
      @problem.alternatives << Alternative.new(sentence: alt)
    end
  end
end
