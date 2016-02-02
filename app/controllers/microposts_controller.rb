# this controller handles the CRUD methods for microposts
class MicropostsController < ApplicationController
  before_action :set_micropost, only: [:destroy]
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
        flash[:success] = 'Congrats your micropost saved'
        redirect_to root_url
    else
      flash[:danger] = 'Micropost did not save'
      render 'static_pages/home'
    end
  end

  # DELETE /microposts/1
  # DELETE /microposts/1.json
  def destroy
    @micropost.destroy
    respond_to do |format|
      format.html { redirect_to microposts_url, notice: 'Micropost was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_micropost
    @micropost = Micropost.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def micropost_params
    params.require(:micropost).permit(:content, :user_id)
  end
end
