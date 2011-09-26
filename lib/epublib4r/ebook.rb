module Epublib4r
  class Ebook
    attr_reader :book

    def initialize(book = nil)
      @book = book.nil? ? Book.new : book
    end

    #
    # Titles
    #
    def add_title(title)
      @book.getMetadata.addTitle(title)
    end

    def get_titles
      @book.getMetadata.getTitles
    end

    #
    # Authors
    #
    def add_author(first_name, last_name)
      @book.getMetadata.addAuthor(Author.new(first_name, last_name))
    end

    def get_authors
      @book.getMetadata.getAuthors
    end

    #
    # Cover Page and Image
    #
    def set_cover_page(file_path)
      @book.setCoverPage(Utils.input_resource(file_path))
    end

    def get_cover_page
      @book.getCoverPage
    end

    def set_cover_image(file_path)
      @book.setCoverImage(Utils.input_resource(file_path))
    end

    def get_cover_image
      @book.getCoverImage
    end

    #
    # Sections and Table of Contents
    #
    def add_section(title, file_path)
      @book.addSection(title, Utils.input_resource(file_path))
    end

    def add_subsection(parent, title, file_path)
      @book.addSection(parent, title, Utils.input_resource(file_path))
    end

    def get_toc
      @book.getTableOfContents
    end

    #
    # Resources
    #
    def add_resource(file_path)
      @book.addResource(Utils.input_resource(file_path))
    end

    #
    # Identifiers
    #
    def add_identifier(scheme, value)
      @book.getMetadata.addIdentifier(Identifier.new(scheme, value))
    end

    def get_scheme
      @book.getMetadata.getIdentifiers.first.getScheme
    end

    def get_date
      @book.getMetadata.getIdentifiers.first.getValue
    end

    #
    # Guide
    #
    def get_guide(guide_type)
      @book.getGuide.getGuideReferencesByType(guide_type)
    end

    #
    # Spine
    #
    def add_spine_from_toc
      @book.generateSpineFromTableOfContents
    end

    def get_spine
      @book.getSpine
    end
  end
end