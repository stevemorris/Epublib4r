module Epublib4r
  class Ebook
    attr_reader :book

    def initialize(book = nil)
      @book     = book || Book.new
      @sections = {}
    end

    #
    # Titles
    #
    def title=(title)
      @book.getMetadata.addTitle(title)
    end

    def titles
      @book.getMetadata.getTitles
    end

    #
    # Authors
    #
    def author=(name)
      @book.getMetadata.addAuthor(Author.new(name.first, name.last))
    end

    def authors
      @book.getMetadata.getAuthors
    end

    #
    # Cover Page and Image
    #
    def cover_page=(path)
      @book.setCoverPage(Utils.input_resource(path))
    end

    def cover_page
      @book.getCoverPage
    end

    def cover_image=(path)
      @book.setCoverImage(Utils.input_resource(path))
    end

    def cover_image
      @book.getCoverImage
    end

    #
    # Sections and Table of Contents
    #
    def section=(options)
      title = options[:title]
      file  = options[:file]
      @sections[title] = if (parent = options[:parent]).nil?
        @book.addSection(title, Utils.input_resource(file))
      else
        @book.addSection(@sections[parent], title, Utils.input_resource(file))
      end
    end

    def table_of_contents
      @book.getTableOfContents
    end

    #
    # Resources
    #
    def resource=(file)
      @book.addResource(Utils.input_resource(file))
    end

    #
    # Identifiers
    #
    def identifier=(hash)
      scheme = hash.keys.first
      value  = hash.values.first
      @book.getMetadata.addIdentifier(Identifier.new(scheme, value))
    end

    def scheme
      @book.getMetadata.getIdentifiers.first.getScheme
    end

    def date
      @book.getMetadata.getIdentifiers.first.getValue
    end

    #
    # Guide
    #
    def guide(guide_type)
      @book.getGuide.getGuideReferencesByType(guide_type)
    end

    #
    # Spine
    #
    def generate_spine
      @book.generateSpineFromTableOfContents
    end

    def spine
      @book.getSpine
    end
  end
end