require 'epublib4r'

# Create new ebook using the DSL
Epublib4r::EPUB.new('book/test_book.epub') do
  title 'Epublib4r Test Book'
  author 'Joe', 'Tester'
  cover 'book/cover.html'  do
    image 'book/cover.png'
  end
  style 'book/book1.css'
  chapter 'book/chapter1.html' do
    title 'First Chapter'
  end
  chapter 'book/chapter2.html' do
    title 'Second Chapter'
    image 'book/flowers.jpg'
    section 'book/chapter2_1.html' do
      title 'Chapter 2, section 1'
    end
  end
  chapter 'book/chapter3.html' do
    title 'Conclusion'
  end
end
