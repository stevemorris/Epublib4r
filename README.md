# Epublib4r

Epublib4r is a Ruby wrapper for the [Epublib Java EPUB library](https://github.com/psiegman/epublib). This library enables you to create EPUB ebook files. The wrapper is a Ruby gem that provides both a DSL (domain specific language) and a Ruby API for creating EPUB files.

I developed this gem as part of [Ruby Mendicant University's](http://university.rubymendicant.com/) September 2011 session.

## Requirements

Epublib4r requires JRuby running in 1.9 mode. Use the JRUBY_OPTS environment variable to set 1.9 mode:

    $ export JRUBY_OPTS=--1.9

## Installation

Clone the repo from GitHub and then build and install the gem locally:

    $ git clone https://github.com/stevemorris/s9-e1
    $ gem build epublib4r.gemspec
    $ gem install epublib4r-0.0.6.gem

## Example Usage

Below is an example of creating an EPUB file using the DSL. This program and other examples can be found in the *examples* folder, and the required book files are in the *examples/book* folder.

    require 'epublib4r'
    
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

The EPUB file created by this program is at *examples/book/test_book.epub*. Note this example is adapted from the example program provided by the Epublib project.

## Tests

To executes the tests, run the rake command:

    $ rake
