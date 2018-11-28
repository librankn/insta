class IgclsController < ApplicationController
  before_action :check_login
  before_action :set_igcl,only: [:show, :edit, :update, :destroy]
  def index
    @igcls=Igcl.all
  end

  def create
    @igcl=Igcl.new(igcl_params)
    @igcl.image.retrieve_from_cache! params[:cache][:image]
    @igcl.user_id = current_user.id
    if @igcl.save
      ContactMailer.contact_mail(@igcl).deliver
      redirect_to igcls_path, notice: "投稿を作成しました！"
    else
      render 'new'
    end
  end

  def new
    if params[:back]
      @igcl = Igcl.new(igcl_params)
      @igcl.image.retrieve_from_cache! params[:cache][:image]
    else
      @igcl=Igcl.new
    end
  end

  def show
    @igcl = Igcl.find(params[:id])
    @user = @igcl.user
    @favorite = current_user.favorites.find_by(igcl_id: @igcl.id)
  end

  def edit
    
  end

  def update
    if @igcl.update(igcl_params)
      redirect_to igcls_path, notice: "投稿を編集しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @igcl.destroy
    redirect_to igcls_path, notice:"投稿を削除しました！"
  end

  def confirm
    @igcl = Igcl.new(igcl_params)
    @igcl.user_id = current_user.id
    render :new if @igcl.invalid?

  end

  private

  def igcl_params
    params.require(:igcl).permit(:title,:content,:image,:image_cache)
  end

  def set_igcl
    @igcl=Igcl.find(params[:id])
  end

  def check_login
    if !logged_in?
      redirect_to new_session_path
    end
  end

end
