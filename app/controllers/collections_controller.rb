class CollectionsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @collections = Collection.all
  end

  def show
    @collection = Collection.find(params[:id])
  end

  def new
    @collection = Collection.new
  end
  
  def create
    @collection = Collection.new(collection_params)
    @collection.user_id = current_user.id
    if @collection.save
      redirect_to collection_path(@collection), notice: '投稿に成功しました。'
    else
      render :new
    end
  end

  def edit
    @collection = Collection.find(params[:id])
    if @collection.user != current_user
      redirect_to collections_path, alert: '不正なアクセスです。'
    end
  end
  
  def update
    @collection = Collection.find(params[:id])
    if @collection.update(collection_params)
      redirect_to collection_path(@collection), notice: '更新に成功しました。'
    else
      render :edit
    end
  end
  
  def destroy
    collection = Collection.find(params[:id])
    collection.destroy
    redirect_to user_path(collection.user), notice: "作品を削除しました。"
  end
  
  private
  def collection_params
    params.require(:collection).permit(:title, :body, :image)
  end
end
