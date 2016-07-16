class Post < ApplicationRecord

  validates :image, presence: true
  # Validates the presence of an image before saving to the DB.

  has_attached_file :image, styles: { :medium => "640x" }
  # Adds an attribute to this class that maps to a file.  This file is typically
  # stored somewhere on the filesystem and has been uploaded by a user.  The
  # attribute returns a Paperclip::Attachment object which handles the management
  # of that file.
  # http://www.rubydoc.info/gems/paperclip/Paperclip/ClassMethods

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  # The above are paperclip methods.  Paperclip is the gem used for image
  # uploading and storage.
end
