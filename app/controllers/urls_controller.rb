class UrlsController < ApplicationController
  def new
    @url = Url.new
  end
  def create
    @url = Url.new(params.require(:url).permit(:url))
    respond_to do |format|
      if @url.save
          format.html {redirect_to @url, notice: 'Criado com sucesso'}
      else
          format.html{ render :new }
      end
    end
  end
  def show
    @url = Url.all
  end
end
