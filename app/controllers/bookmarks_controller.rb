class BookmarksController < ApplicationController
  before_action :set_bookmark, only: %i[show create destroy]

  def index
    @bookmarks = Bookmark.all
  end

  def show
    # @bookmark = Bookmark.find(params[:id])
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new([bookmark_params])
    if @bookmark.save
      redirect_to @bookmark, notice: "Bookmark was successufully created"
    else
      render :new, status: unprocessable_entity
    end
  end

  def destroy
    @bookmark.destroy
    redirect_to lists_url, notice: "Bookmark was successfully destroyed."
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end
end
