class Scribble < ActiveRecord::Base
  
  belongs_to :user
  has_paper_trail

  #def update
  #	@scribble = Scribble.find(params[:id])
  #	authorize @scribble
  #	if @scribble.update(scribble_params)
  #		redirect_to @scribble
  #	else
  #	   render :edit
  #	end
end
