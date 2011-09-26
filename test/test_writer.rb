require 'test/unit'
require_relative '../lib/epublib4r'

class EpubWriterTest < Test::Unit::TestCase
  def setup
    @path  = File.dirname(__FILE__) + '/../examples/book/'
    @ebook = Epublib4r::Ebook.new

    @ebook.add_title('Epublib4r Test Book')
    @ebook.add_title('test2')

    @ebook.add_identifier(Identifier::Scheme::ISBN, '987654321')
    @ebook.add_author('Joe', 'Tester')
    @ebook.set_cover_page(@path + 'cover.html')
    @ebook.set_cover_image(@path + 'cover.png')
    @ebook.add_section('Chapter 1', @path + 'chapter1.html')
    @ebook.add_resource(@path + 'book1.css')
    chapter2 = @ebook.add_section('Second chapter', @path + 'chapter2.html')
    @ebook.add_resource(@path + 'flowers.jpg')
    @ebook.add_subsection(chapter2, 'Chapter 2 section 1', @path + 'chapter2_1.html')
    @ebook.add_section('Chapter 3', @path + 'chapter3.html')
  end

  def test_ebook_generation
    ebook_data = Epublib4r::Writer.write_buffer(@ebook)
    assert_not_nil(ebook_data)
    assert(ebook_data.length > 0)

    read_ebook = Epublib4r::Ebook.new(Epublib4r::Reader.read_buffer(ebook_data))

    assert_equal(@ebook.get_titles, read_ebook.get_titles)
    assert_equal(Identifier::Scheme::ISBN, read_ebook.get_scheme)
    assert_equal(@ebook.get_date, read_ebook.get_date)
    assert_equal(@ebook.get_authors, read_ebook.get_authors)
    assert_equal(1, read_ebook.get_guide(GuideReference.COVER).size)
    assert_not_nil(@ebook.get_cover_page)
    assert_not_nil(@ebook.get_cover_image)
    assert_equal(4, read_ebook.get_toc.size)
  end
end
