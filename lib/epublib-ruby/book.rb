module EPubLib
  class Book
    attr_reader :book

    def initialize
      @book = Book.new
    end

    def add_title(title)
      @book.getMetadata.addTitle(title)
    end

    def add_author(first_name, last_name)
      @book.getMetadata.addAuthor(Author.new(first_name, last_name))
    end

    def set_cover_page(page_path)
      resource = Resource.new(FileInputStream.new(page_path), page_path)
      @book.setCoverPage(resource)
    end

    def set_cover_image(image_path)
      resource = Resource.new(FileInputStream.new(image_path), image_path)
      @book.setCoverImage(resource)
    end

    def add_section(section_name, section_path)
      resource = Resource.new(FileInputStream.new(section_path), section_path)
      @book.addSection(section_name, resource)
    end

    def add_resource(resource_path)
      resource = Resource.new(FileInputStream.new(resource_path), resource_path)
      @book.addResource(resource)
    end
  end
end