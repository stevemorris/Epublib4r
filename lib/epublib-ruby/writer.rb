module EPubLib
  class Writer
    def initialize
      @writer = EpubWriter.new
    end

    def write(book, file_path)
      @writer.write(book, FileOutputStream.new(file_path))
    end
  end
end
