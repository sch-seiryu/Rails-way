class Api::V1::ContentsController < Api::V1::ApplicationController
  # protect_from_forgery with: :null_session
  # skip_before_action :verify_authenticity_token  # Neutralize CSRF, but it seems not recommended; I need further investigation over security guides.

  # TODO Added@2023-04-11 11:33:29
  protect_from_forgery prepend: true
  before_action :authorize, exclude: [:index] # only: [:edit, :update, :destroy]

  def index
    # index page shows contents themselves or particular data such as the current number of the contents.
    @contents = Content.all
    puts "\n=====\n", session, "\n====="
  end

  def new
    @content = Content.new
  end
  
  def create
    @content = Content.new(content_params.merge!(user: current_user.user_id))  # TODO refer 'User'

    if @content.save
      redirect_to @content
    else
      render :new, status: :unprocessable_entity
    end
    # TODO proper return value with formed info(like, id)
  end

  def show
    @content = Content.find(params[:id])
  end

  def edit
    @content = Content.find(params[:id])
  end

  def update
    # TODO scheduled to do after the 'destroy' feature.
    print "AHHHH"
  end

  def destroy
    # TODO apply auth, and apply auth too for 'create', too.(including token handling methods)
    @content = Content.find(params[:id])
    @content.destroy  # TODO what about error handling?

    redirect_to root, status: :see_other  # TODO choose proper response code
  end

  # Using Strong Parameters for security
  private
    def content_params
      params.permit(:title, :body)  #, current_user # user?
    end
end
