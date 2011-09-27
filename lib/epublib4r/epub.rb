module Epublib4r
  class EPUB
    attr_accessor :ebook, :paths

    def initialize(path, &block)
      self.ebook = Epublib4r::Ebook.new
      self.paths = []

      instance_eval &block

      self.ebook.write(path)
    end

    def title(title)
      if paths.empty?
        ebook.title = title
      elsif paths.size == 1
        ebook.section = { title: title, path: paths[0] }
      else
        ebook.section = { title: title, path: paths[-1], parent: paths[-2] }
      end 
    end

    def author(first_name, last_name)
      ebook.author = first_name, last_name
    end

    def cover(path, &block)
      ebook.cover_page = path
      paths.push(:cover)
      instance_eval &block
      paths.pop
    end

    def image(path)
      if (paths[0] == :cover)
        ebook.cover_image = path
      else
        ebook.image = path
      end
    end

    def style(path)
      ebook.style_sheet = path
    end

    def chapter(path, &block)
      paths.push(path)
      instance_eval &block
      paths.pop
    end

    alias :section :chapter
  end
end
