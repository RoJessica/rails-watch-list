class ListsController < ApplicationController
  before_action :set_list, only: [:new, :create]

  def index
    @lists = List.all
  end

  def new
    @list = List.new
    @bookmark = Bookmark.new
  end

  def create
    @list = List.new(params_list)
    @bookmark = Bookmark.new(params_bookmark)
    @bookmark.list = @list
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @list = List.find(params[:id])
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def params_list
    params.require(:list).permit(:name)
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
