class DisciplineClass < ActiveRecord::Base
  belongs_to :user
  belongs_to :discipline
  has_many :class_files

  alias :attachments :class_files

  def attachments_array=(array)
    unless array.nil?
      array.each do |file|
        class_files.create(:attachment => file)
      end
    end
  end

  def make_json(request)
    files = []
    class_files.each do |file|
      files << file.json(request)
    end
    files
  end

end
