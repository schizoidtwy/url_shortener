class UrlsController < ApplicationController
  require 'base32/crockford'
  def new
    @url = Url.new
  end
  def create
    @url = Url.new(params.require(:url).permit(:url))
    lastId = (Url.last.id + 1).to_s

    lastId = Base32::Crockford.encode("27")
    @url.short_url = lastId
    respond_to do |format|
      if @url.save
          format.html {redirect_to @url, notice: 'Criado com sucesso'}
      else
          format.html{ render :new }
      end
    end
  end
  def show
    @url = Url.last.short_url
  end
end
