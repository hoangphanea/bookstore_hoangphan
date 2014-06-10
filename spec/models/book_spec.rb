require 'spec_helper'

describe Book do
  describe User do
    let(:book) { FactoryGirl.create(:book) }
    let(:book1) { FactoryGirl.create(:book, title: "keywordss") }
    let(:book2) { FactoryGirl.create(:book, author_name: "abkeyword") }

    specify { expect(Book.search("keyword")).to eq([book1, book2]) }
  end
end
