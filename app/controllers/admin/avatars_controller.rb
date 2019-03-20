class Admin::AvatarsController < Admin::AdminBaseController
  
  def new
    render :new
  end 

  def create
    file = params[:avatar]
    #res = UploadPictureService.new(file).call
    file_name, tmp = file.original_filename, file.tempfile
    avatar = Avatar.new
    avatar.nm = file_name
    puts tmp
    avatar.file = tmp
    avatar.save!
    puts avatar.id.to_s
  end


end
