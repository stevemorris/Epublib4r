require 'test/unit'
require_relative '../lib/epublib4r'

class EPUBWriterTest < Test::Unit::TestCase
  PATH = File.dirname(__FILE__) + '/../examples/book/'

  def setup
    @ebook = Epublib4r::Ebook.new

    @ebook.title = 'Epublib4r Test Book'
    @ebook.title = 'Subtitle'

    @ebook.identifier = { Identifier::Scheme::ISBN => '987654321' }
    @ebook.author = 'Joe', 'Tester'
    @ebook.cover_page = PATH + 'cover.html'
    @ebook.cover_image = PATH + 'cover.png'
    @ebook.section = { title: 'Chapter 1', path: PATH + 'chapter1.html' }
    @ebook.style_sheet = PATH + 'book1.css'
    chapter2 = PATH + 'chapter2.html'
    @ebook.section = { title: 'Second chapter', path: chapter2 }
    @ebook.image = PATH + 'flowers.jpg'
    @ebook.section = { title: 'Chapter 2 section 1', path: PATH + 'chapter2_1.html', parent: chapter2 }
    @ebook.section = { title: 'Chapter 3', path: PATH + 'chapter3.html' }
  end

  def test_ebook_generation
    ebook_data = @ebook.buffer
    assert_not_nil(ebook_data)
    assert(ebook_data.length > 0)

    read_ebook = Epublib4r::Ebook.new
    read_ebook.buffer = ebook_data

    assert_equal(@ebook.titles, read_ebook.titles)
    assert_equal(Identifier::Scheme::ISBN, read_ebook.scheme)
    assert_equal(@ebook.date, read_ebook.date)
    assert_equal(@ebook.authors, read_ebook.authors)
    assert_equal(1, read_ebook.guide(GuideReference.COVER).size)
    assert_not_nil(@ebook.cover_page)
    assert_not_nil(@ebook.cover_image)
    assert_equal(4, read_ebook.table_of_contents.size)
  end
end
