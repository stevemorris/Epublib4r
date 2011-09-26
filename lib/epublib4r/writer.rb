module Epublib4r
  module Writer
    extend self

    def write_file(ebook, file_path)
      EpubWriter.new.write(ebook.book, Utils.output_file(file_path))
    end

    def write_buffer(ebook)
      buffer = Utils.output_array
      EpubWriter.new.write(ebook.book, buffer)
      buffer.toByteArray()
    end
  end
end
