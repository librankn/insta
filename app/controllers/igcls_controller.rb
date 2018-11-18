class IgclsController < ApplicationController
  before_action :set_igcl,only: [:show, :edit, :update, :destroy]
  def index
    @igcls=Igcl.all
  end

  def create
    @igcl=Igcl.create(igcl_params)
    if @igcl.save
      redirect_to igcls_path, notice: "ブログを作成しました！"
    else
      render 'new'
    end
  end

  def new
    if params[:back]
      @igcl = Igcl.new(igcl_params)
    else
      @igcl=Igcl.new
    end
  end

  def show
    
  end

  def edit
    
  end

  def update
    
    if @igcl.update(igcl_params)
      redirect_to igcls_path, notice: "ブログを編集しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @igcl.destroy
    redirect_to igcls_path, notice:"ブログを削除しました！"
  end

  def confirm
    @igcl = Igcl.new(igcl_params)
    render :new if @igcl.invalid?

  end

  private

  def igcl_params
    params.require(:igcl).permit(:title,:content)
  end

  def set_igcl
    @igcl=Igcl.find(params[:id])
  end
end
