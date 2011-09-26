module Epublib4r
  module Reader
    extend self

    def read_file(file_path)
      Ebook.new(EpubReader.new.readEpub(Utils.input_file(file_path)))
    end

    def read_buffer(buffer)
      EpubReader.new.readEpub(Utils.input_array(buffer))
    end
  end
end
