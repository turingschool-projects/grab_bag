class DataSlurper

  def initialize(path, extension)
    @path = path
    @extension = extension
    @pictures = (%w(jpeg tiff))
    @files = (%w(docx pdf doc xls xlsx ppt pptx))
  end

  def direct_slurping
    if pictures.include?(extension)
      picture_slurping
    elsif files.include?(extension)
      file_slurping
    end
  end



  private
  attr_reader :path, :extension, :pictures, :files

  def file_slurping
    yomu = Yomu.new(path)

  end

  def picture_slurping
  end
end
