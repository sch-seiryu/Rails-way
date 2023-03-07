class Api::V1::ContentsController < Api::V1::ApplicationController

  # protect_from_forgery with: :null_session
  # skip_before_action :verify_authenticity_token  # Neutralize CSRF, but it seems not recommended; I need further investigation over security guides.

  def index
    # index page shows contents themselves or particular data such as the current number of the contents.
    @contents = Content.all
  end

  def new
    @content = Content.new
  end
  
  def create
    # @content = Content.new(params[:title, :body])  # TODO refer 'User'
    @content = Content.new(content_params)  # TODO refer 'User'
    # @content = Content.new(params.slice(:title, :body))  # TODO refer 'User'

    if @content.save
      redirect_to @content
    else
      render :new, status: :unprocessable_entity
    end
    # TODO proper return value with formed info(like, id)
  end

  def get
    @content = Content.find(params[:id])
  end

  def update
  end

  def delete
  end

  # Using Strong Parameters for security
  private
    def content_params
      # params.require(:content).permit(:title, :body)
      # params.permit(:title, :body, :authenticity_token)
      # params.require(:title, :body).permit(:authenticity_token)
      # params.require(:authenticity_token).permit(:title, :body)
      # params.permit(:authenticity_token)
      # params.permit(:title, :body)
      # params.permit(:authenticity_token, :commit).require([:title, :body])
      # params.require([:title, :body]).permit(:authenticity_token, :commit)
      
      # params.require(:title).permit(:authenticity_token, :commit)
      # params.require(:body).permit(:authenticity_token, :commit)

      # {title: params.require(:title)
      # body: params.require(:body)}
      
      # params

      # params.permit(:title, :body, :authenticity_token, :commit).slice(:title, :body)
      params.permit(:title, :body, ) # user?
    end
end
