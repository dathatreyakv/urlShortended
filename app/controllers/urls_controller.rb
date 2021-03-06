class UrlsController < ApplicationController
  before_action :find_url, only: [:show]

  def index
    @url = Url.new
  end

  def show
    redirect_to @url.sanitized_url
  end

  def create
    @url = Url.new(url_params)
    @url.sanitize
    if @url.new_url?
      if @url.save
        # redirect_to shortened_path(@url.short_url)
      else
        flash[:error] = "Check the error below:"
        render 'index'
      end
    else
    	binding.pry
    	@url = @url.find_duplicate
      flash[:notice] = "A short link for this URL is already in our database"
      # redirect_to shortened_path(@url.short_url)
    end
  end

  def shortened

  	binding.pry
  end

  private

  def find_url
    @url = Url.find_by_short_url(params[:short_url])
  end

  def url_params
    params.require(:url).permit(:original_url)
  end


end
