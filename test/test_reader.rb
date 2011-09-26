require 'test/unit'
require_relative '../lib/epublib4r'

class EpubReaderTest < Test::Unit::TestCase
  def setup
    @path = File.dirname(__FILE__) + '/../examples/book/'
  end

  def test_cover_only_cover
    ebook = Epublib4r::Ebook.new

    ebook.set_cover_image(@path + 'cover.png')

    ebook_data = Epublib4r::Writer.write_buffer(ebook)
    read_ebook = Epublib4r::Ebook.new(Epublib4r::Reader.read_buffer(ebook_data))
    assert_not_nil(read_ebook.get_cover_image)
  end

  def test_cover_one_section
    ebook = Epublib4r::Ebook.new

    ebook.set_cover_image(@path + 'cover.png')
    ebook.add_section('Introduction', @path + 'chapter1.html')
    ebook.add_spine_from_toc

    ebook_data = Epublib4r::Writer.write_buffer(ebook)
    read_ebook = Epublib4r::Ebook.new(Epublib4r::Reader.read_buffer(ebook_data))
    assert_not_nil(read_ebook.get_cover_page)
    assert_equal(1, read_ebook.get_spine.size)
    assert_equal(1, read_ebook.get_toc.size)
  end
end
