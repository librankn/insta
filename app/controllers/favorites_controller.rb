class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(igcl_id: params[:igcl_id])
    redirect_to igcls_url, notice: "#{favorite.igcl.user.name}さんのブログをお気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to igcls_url, notice: "#{favorite.igcl.user.name}さんのブログをお気に入り解除しました"
  end
end
