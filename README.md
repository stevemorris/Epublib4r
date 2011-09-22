# Epublib-Ruby

Epublib-Ruby is a Ruby wrapper for the [Epublib Java EPUB library](https://github.com/psiegman/epublib). This library enables you to read and write EPUB files. The wrapper is a Ruby gem and provides a Ruby interface to core features of the Epublib Java library.

I developed this gem as part of [Ruby Mendicant University's](http://university.rubymendicant.com/) September 2011 session.

## Requirements

JRuby running in 1.9 mode.

## Examples

The project includes two Ruby example programs translated from the Epublib project Java examples. These examples can be found in the *examples* folder, and the required book files are in the *examples/book* folder. 
The following example illustrates the API calls for creating an EPUB file:

    require 'epublib-ruby'

    # Create new ebook
    ebook = Epublib::Ebook.new

    # Set the title
    ebook.add_title('Epublib Test Book')

    # Add an author
    ebook.add_author('Joe', 'Tester')

    # Set cover page
    ebook.set_cover_page('book/cover.html')

    # Set cover image
    ebook.set_cover_image('book/cover.png')

    # Add Chapter 1
    ebook.add_section('Introduction', 'book/chapter1.html')

    # Add CSS file
    ebook.add_resource('book/book1.css')

    # Add Chapter 2
    chapter2 = ebook.add_section('Second Chapter', 'book/chapter2.html')

    # Add image used by Chapter 2
    ebook.add_resource('book/flowers.jpg')

    # Add Chapter2, Section 1
    ebook.add_subsection(chapter2, 'Chapter 2, section 1', 'book/chapter2_1.html')

    # Add Chapter 3
    ebook.add_section('Conclusion', 'book/chapter3.html')

    # Write the ebook as EPUB
    Epublib::Writer.write_file(ebook, 'book/test_book.epub')


## Tests

To run the tests, run the rake command:

    $ rake
