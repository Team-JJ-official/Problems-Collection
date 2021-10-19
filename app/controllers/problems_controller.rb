class ProblemsController < ApplicationController
  def index
  end

  def show
    @problem = Problem.where("id >= ?", params[:id]).first || Problem.first
  end

  def new
    @problem = Problem.new
  end

  def create
    @problem = Problem.new(problem_params)
    @answer_id = params[:problem][:answer].to_i
    if params_integrity? and @problem.save
      update_alternatives
      @problem.update(answer: @problem.alternatives[@answer_id])
      flash[:success] = "{ジャンル：#{@problem.genre}} 問題を作成しました"
      redirect_to root_path
    else
      @alternatives = []
      params[:alternatives].each do |sentence|
        @alternatives += [Alternative.new(sentence: sentence)]
      end
      flash.now[:danger] = "不正な項目があります"
      render "new"
    end
  end

  def edit
    if @problem = Problem.find_by(id: params[:id])
      @alternatives = @problem.alternatives
      @answer_id = @alternatives.index(@problem.answer)
    else
      flash[:warning] = "存在しないIDです"
      redirect_to root_path
    end
    
  end

  def update
    if @problem = Problem.find_by(id: params[:id])
      @alternatives = @problem.alternatives
      @answer_id = params[:problem][:answer].to_i
      if params_integrity? and @problem.update(problem_params)
        update_alternatives
        @problem.update(answer: @problem.alternatives[@answer_id])
        flash[:success] = "問題を更新しました"
        redirect_to problem_path(@problem)
      else
        flash.now[:danger] = "不正な項目があります"
        render "edit"
      end
    else
      flash[:danger] = "不正なIDです"
      redirect_to root_path
    end
  end

  def destroy
    if @problem = Problem.find_by(id: params[:id])
      @problem.update(answer: nil)
      @problem.destroy
      flash[:warning] = "問題ID:#{params[:id]} 削除しました"
      redirect_to root_path
    else
      flash[:danger] = "不正なIDです"
      redirect_to root_path
    end
  end

  private

  def params_integrity?
    ans = true
    if !params[:alternatives] || params[:alternatives].include?("")
      @problem.errors.add(:base, "選択肢が空です")
      ans = false
    end
    if !params[:problem][:answer]
      @problem.errors.add(:problem_type_id, "正解が選択されていません")
      ans = false
    end
    return ans
  end

  def problem_params
    params.require(:problem)[:problem_type] ||= ProblemType.first
    params.require(:problem).permit(:sentence, :explanation, :genre, :problem_type_id)
  end

  def update_alternatives
    @problem.update(answer: nil)
    @problem.alternatives.destroy_all
    params[:alternatives].each do |alt|
      @problem.alternatives << Alternative.new(sentence: alt)
    end
  end
end
