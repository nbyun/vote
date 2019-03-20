class Admin::AvatarsController < Admin::AdminBaseController
  
  def new
    render :new
  end 

  def create
    file = params[:avatar]
    res = UploadPictureService.new(file).call
    puts res

  end


end
