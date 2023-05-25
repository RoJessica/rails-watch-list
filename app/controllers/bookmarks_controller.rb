class BookmarksController < ApplicationController
  def destroy
    @bookmark = Bookmark.find(params[:id])
    @list = @bookmark.list
    @bookmark.destroy

    redirect_to list_path(@list),
    status: :see_other
  end
end
