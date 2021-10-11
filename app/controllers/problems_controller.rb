class ProblemsController < ApplicationController
  def index
  end

  def new
    @problem = Problem.new
  end

  def create
    @problem = Problem.create(problem_params)
    if @problem.save
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
    params.require(:problem).permit(:sentence, :answer, :explanation, :genre, :problem_type_id)
  end
end
