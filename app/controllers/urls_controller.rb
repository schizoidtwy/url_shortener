class UrlsController < ApplicationController
  require 'base32/crockford'

  def new
    @url = Url.new
    if user_signed_in?
      @posts_usuario = current_user.urls.where
      .not(short_url: nil).order(created_at: :desc)
    end
  end

  def create
    @url = Url.new(params.require(:url).permit(:url))
    @url.user = current_user

    if !Url.last.nil?
      lastId = (Url.last.id + 1)**5
    else
      lastId = 0
    end

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
    @url = Url.where(id:params.require(:id)).first.short_url
  end

  def redirect
    @url = Url.where(short_url: params.require(:short_url)).first.url
    redirect_to @url, :status => :moved_permanently
  end
end
