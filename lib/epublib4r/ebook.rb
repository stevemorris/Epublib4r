module Epublib4r
  class Ebook
    def initialize(path = nil)
      @book = if path.nil?
        Book.new
      else
        EpubReader.new.readEpub(FileInputStream.new(path))
      end

      @sections = {}
    end

    def write(path)
      EpubWriter.new.write(@book, FileOutputStream.new(File.expand_path(path)))
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
      @book.setCoverPage(resource(path))
    end
    
    def cover_page
      @book.getCoverPage
    end
    
    def cover_image=(path)
      @book.setCoverImage(resource(path))
    end
    
    def cover_image
      @book.getCoverImage
    end

    #
    # Style Sheet
    #
    def style_sheet=(path)
      @book.addResource(resource(path))
    end

    #
    # Section
    #
    def section=(options)
      title = options[:title]
      path  = options[:path]
      @sections[path] = if (parent = options[:parent]).nil?
        @book.addSection(title, resource(path))
      else
        @book.addSection(@sections[parent], title, resource(path))
      end
    end

    #
    # Image
    #
    def image=(path)
      @book.addResource(resource(path))
    end

    #
    # Table of Contents
    #
    def table_of_contents
      @book.getTableOfContents
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

    #
    # Buffer (used by unit tests)
    #
    def buffer=(other_buffer)
      @book = EpubReader.new.readEpub(ByteArrayInputStream.new(other_buffer))
    end

    def buffer
      stream = ByteArrayOutputStream.new
      EpubWriter.new.write(@book, stream)
      stream.toByteArray()
    end

    private

    def resource(path)
      full_path = File.expand_path(path)
      Resource.new(FileInputStream.new(full_path), File.basename(path))
    end
  end
end