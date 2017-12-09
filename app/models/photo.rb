class Photo < ApplicationRecord
    belongs_to :imageable, polymorphic: true, optional: true
    has_attached_file :image,
    styles: lambda { |a| a.instance.check_file_type},
    processors: lambda { |a| a.is_video_type? ? [ :ffmpeg ] : [ :thumbnail ] }


    validates_attachment_content_type :image, :content_type => /.*/
    validates_with AttachmentSizeValidator, attributes: :image, less_than: 5.megabytes
    serialize :metadata



  def check_file_type
    if is_image_type?
      {:large => "750x750>", :medium => "300x300#", :thumb => "100x100#" }
    elsif is_video_type?
      {
          :medium => { :geometry => "300x300#", :format => 'jpg'},
          :video => {:geometry => "640x360#", :format => 'mp4', :processors => [:transcoder]}
      }
    elsif is_audio_type?
      {
        :audio => {
          :format => "mp3", :processors => [:transcoder]
        }
      }
     # avatar_file_name = self.basename(:avatar_file_name, self.extname(:avatar_file_name))
    else
      {}
    end
  end




  # Method returns true if file's content type contains word 'image', overwise false
  def is_image_type?
    image_content_type =~ %r(image)
  end

  # Method returns true if file's content type contains word 'video', overwise false
  def is_video_type?
    image_content_type =~ %r(video)
  end

  # Method returns true if file's content type contains word 'audio', overwise false
  def is_audio_type?
    image_content_type =~ %r(audio)
  end





end
