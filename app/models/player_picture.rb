class PlayerPicture < ApplicationRecord
  acts_as_paranoid
  belongs_to :player
  #has_attached_file :image, styles: { thumb: '150x204>' },
  #                  :url => Settings[:player_picture_url],
  #                  :path => Settings[:player_picture_path]
  #validates_attachment :image, presence: true,
  #                     content_type: { content_type: /\Aimage\/.*\Z/ },
  #                     size: { less_than: 50.megabytes }
  #do_not_validate_attachment_file_type :image
  #after_validation :reject_content_type_error_msg

  # {:image_content_type=>["の形式が正しくありません。"], :image=>["の形式が正しくありません。"]}
  #【引数】
  #【返値】
  #【注意】
  #【著作】
  def reject_content_type_error_msg
    self.errors.messages.delete_if{|key,value| key.to_s.eql?('image_content_type') || key.to_s.eql?('image_file_size')}
  end

end
