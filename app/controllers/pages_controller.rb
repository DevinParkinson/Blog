class PagesController < ApplicationController
#GET /pages
  def index
    @pages = Page.all
  end

#Get /pages/:id

  def show
    Page.find(params[:id])
  end

#GET /pages/new

  def new
    @page = Page.new
  end

  #POST /pages
  def create
    @page = Page.new(page_params)

    if @page.save
      redirect_to page_path(@page)
    else
      render :new
    end
  end

  private
    def page_params
      params.require(:page).permit(:body, :author, :title)
    end
end
