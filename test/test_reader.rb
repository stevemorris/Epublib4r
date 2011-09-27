require 'test/unit'
require_relative '../lib/epublib4r'

class EPUBReaderTest < Test::Unit::TestCase
  PATH = File.dirname(__FILE__) + '/../examples/book/'

  def test_cover_only_cover
    ebook = Epublib4r::Ebook.new

    ebook.cover_image = PATH + 'cover.png'

    ebook_data = ebook.buffer
    read_ebook = Epublib4r::Ebook.new
    read_ebook.buffer = ebook.buffer
    assert_not_nil(read_ebook.cover_image)
  end

  def test_cover_one_section
    ebook = Epublib4r::Ebook.new

    ebook.cover_image = PATH + 'cover.png'
    ebook.section = { title: 'Introduction', path: PATH + 'chapter1.html' }
    ebook.generate_spine

    ebook_data = ebook.buffer
    read_ebook = Epublib4r::Ebook.new
    read_ebook.buffer = ebook.buffer
    assert_not_nil(read_ebook.cover_page)
    assert_equal(1, read_ebook.spine.size)
    assert_equal(1, read_ebook.table_of_contents.size)
  end
end
