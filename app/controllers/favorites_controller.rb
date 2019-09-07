class FavoritesController < ApplicationController
  def index
    @favorites=Favorite.all
    end
  def create
    favorite = current_user.favorites.create(post_id: params[:post_id])
    redirect_to posts_path, notice: "#{favorite.post.user.name}'s post has been favorited"
  end
  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to posts_path, notice: "#{favorite.post.user.name}'s blog has been unfavored"
  end
end