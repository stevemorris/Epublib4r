module Epublib4r
  module Utils
    extend self

    def input_resource(file_path)
      full_path = File.expand_path(file_path)
      base_name = File.basename(file_path)
      Resource.new(FileInputStream.new(full_path), base_name)
    end

    def input_file(file_path)
      FileInputStream.new(file_path)
    end

    def output_file(path)
      FileOutputStream.new(File.expand_path(path))
    end

    def input_array(buffer)
      ByteArrayInputStream.new(buffer)
    end

    def output_array
      ByteArrayOutputStream.new
    end
  end
end
