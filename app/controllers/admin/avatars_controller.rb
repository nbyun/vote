class Admin::AvatarsController < Admin::AdminBaseController
  
  def new
    render :new
  end 

  def create
    file = params[:avatar]
    #res = UploadPictureService.new(file).call
    file_name, tmp = file[:filename].to_s, file[:tmp]
    avatar = Avatar.new
    avatar.nm = file_name
    avatar.image = tmp
    avatar.save!
    puts avatar.id.to_s
  end


end
