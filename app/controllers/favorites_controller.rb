class FavoritesController < ApplicationController
    def create
        #current_userに結びついたいいねを作成↓
        @favorite = current_user.favorites.create(collection_id: params[:collection_id])
        redirect_back(fallback_location: root_path)
    end

    def destroy
        #どのCollectionに結びついているいいねを削除するのかを定義↓
        @collection = Collection.find(params[:collection_id])
        @favorite = current_user.favorites.find_by(collection_id: @collection.id)
        @favorite.destroy
        redirect_back(fallback_location: root_path)
    end
end
