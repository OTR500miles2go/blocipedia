class WikisController < ApplicationController
  before_action :set_wiki, only: [:show, :edit, :update, :destroy]

  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index

  def index
    @wikis = policy_scope(Wiki)
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new(params.permit(:id))
    authorize @wiki
  end

  def create
   @wiki = Wiki.new(params.permit(:id))
   @wiki.user = current_user

   authorize @wiki

   @wiki.title = params[:wiki][:title]
   @wiki.body = params[:wiki][:body]
   @wiki.private = params[:wiki][:private]
   @wiki.user = current_user

   if @wiki.save
      flash[:notice] = "Your wiki was saved."
      redirect_to @wiki
   else
      flash[:alert] = "Something went wrong. Please try again."
      render :new
   end
  end

  def edit
    @wiki = Wiki.find(params[:id])
    authorize @wiki
    @collaborator = Collaborator.all
    @selected_collaborators = []
    
  end

  def update
    @wiki = Wiki.find(params[:id])
    authorize @wiki

    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]
    @wiki.private = params[:wiki][:private]
    @wiki.user = current_user

    if @wiki.save
        flash[:notice] = "Your wiki was updated."
        redirect_to @wiki
    else
        flash.now[:alert] = "Your change was not saved. Please try again."
        render :edit
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])
    authorize @wiki

    if @wiki.destroy
        flash[:notice] = "\"#{@wiki.title}\" was deleted!"
        redirect_to wikis_path
    else
        flash.now[:alert] = "Unable to delete, please try again."
        render :show
    end
  end 
 
  private
    def set_wiki
      @wiki = Wiki.find(params[:id])
      authorize @wiki
    end

    def wiki_params
      params.require(:wiki).permit(:title, :body, :private )
    end  
end