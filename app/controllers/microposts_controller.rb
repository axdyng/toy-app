class MicropostsController < ApplicationController
  before_action :set_micropost, only: [:update, :destroy]

  # check if already logged in
  before_action :require_login,  only: [:update, :destroy]

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
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
      params.require(:micropost).permit(:content)
    end

    def require_login
      #check if the user is logged in or not
      unless logged_in?
        flash[:danger] = "WHAT CHU DOING? Login first!"
        redirect_to root_url # halts request cycle
      end
    end
end
