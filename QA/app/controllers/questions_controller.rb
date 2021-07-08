class QuestionsController < ApplicationController

  before_action :set_question, only:[:show,:edit,:update,:destroy]

  def index
    @questions=Question.all
  end

  def show
    # @questions =Question.find(params[:id])
    # 新しいやつ作成
    @answer =Answer.new
  end

  def new
    @questions=Question.new
  end

  def create
    @questions =Question.new(question_params)
    if @questions.save
      redirect_to root_path,notice:'Success!'
    else
      flash[:alert] = "Save error!"
      render :new
    end
  end

  def edit

    # idの指定だけで見つけられる
    # @questions =Question.find(params[:id])
  end

  def update

    # @questions =Question.find(params[:id])
    if @questions.update(question_params)
      redirect_to root_path,notice:'Success!'
    else
      flash[:alert] = "Save error"
      render :edit
    end

  end

  def destroy
    @questions =Question.find(params[:id])
    @questions.destroy
    redirect_to root_path,notice:'Success!'
  end


  private
  def set_question
    @questions =Question.find(params[:id])
  end

  private
  #フォームから送られてきたデータのみを受け付けるようになる
    def question_params
      # byebug←これ入れるとデバックモードになる
      params.require(:question).permit(:name,:title,:content)
    end
end
