class UrlsController < ApplicationController
  require 'base32/crockford'
  def new
    @url = Url.new
  end
  def create
    @url = Url.new(params.require(:url).permit(:url))
    lastId = Url.last.id**5

    lastId = Base32::Crockford.encode(lastId)
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
    @url = "#{request.domain}:#{request.port}/#{Url.last.short_url}"
  end
  def redirect
    @url = Url.where(short_url: params.require(:short_url)).first.url
    redirect_to @url, :status => :moved_permanently
  end
end
