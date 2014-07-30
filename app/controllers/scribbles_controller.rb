class ScribblesController < ApplicationController

  #before_action :set_scribble, only: [:show, :edit, :update, :destroy]

  # GET /scribbles
  # GET /scribbles.json
  def index
    @scribbles = Scribble.all
    #show posts from current user OR posts that are shared with the current user
    #@scribbles = current_user.scribbles 

  end

  def shared_with
    #read shared_with from scribble, turn array of users, lookup in usertable
  end

  # GET /scribbles/1
  # GET /scribbles/1.json
  def show
     @scribble = Scribble.find(params[:id])
     authorize @scribble
  end

  # GET /scribbles/new
  def new
    @scribble = Scribble.new
  end


  # GET /scribbles/1/edit
  def edit
     @scribble = Scribble.find(params[:id])
     authorize @scribble
  end

  # POST /scribbles
  # POST /scribbles.json
  def create
    @scribble = Scribble.new(scribble_params)
    
    #link scribble to user
    @scribble.user_id = current_user.id
    @scribble.created = DateTime.now
    respond_to do |format|
      if @scribble.save
        format.html { redirect_to @scribble, notice: 'Scribble was successfully created.' }
        format.json { render :show, status: :created, location: @scribble }
      else
        format.html { render :new }
        format.json { render json: @scribble.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scribbles/1
  # PATCH/PUT /scribbles/1.json
  
  def update
    @scribble = Scribble.find(params[:id])
    respond_to do |format|
      if @scribble.update(scribble_params)
        format.html { redirect_to @scribble, notice: 'Scribble was successfully updated.' }
        format.json { render :show, status: :ok, location: @scribble }
      else
        format.html { render :edit }
        format.json { render json: @scribble.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scribbles/1
  # DELETE /scribbles/1.json
  def destroy
    @scribble.destroy
    respond_to do |format|
      format.html { redirect_to scribbles_url, notice: 'Scribble was successfully deleted. #{undo_link}' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scribble
      @scribble = Scribble.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scribble_params
      params.require(:scribble).permit(:title, :tags, :content, :created, :published)
    end
      
    def undo_link  
      view_context.link_to("undo",
        revert_version_path(@scribble.versions.scoped.last),
        :method => :post)
  end

end
