class ClassFile < ActiveRecord::Base
  belongs_to :discipline_class
  has_attached_file :attachment

  validates :attachment, attachment_presence: true
  validates_attachment :attachment, content_type: { content_type: /\.*\Z/ }

  def url
    attachment.url
  end

  def original_filename
    attachment.original_filename
  end

  def json(request)
    {
        nome: original_filename,
        url: "#{request.protocol}#{request.host}#{url}"
    }
  end

end
