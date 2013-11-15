require "test_helper"

describe Blog::Post do
  before do 
    I18n.available_locales = [:en, :cs, :de]
  end

  let(:post)          { build_stubbed(:post) }
  let(:translation)   { build_stubbed(:post_translation) }

  it "default must be valid" do
    post.must_be :valid?
  end

  it "must have at least one translation" do
    build_stubbed(:post, translations: []).wont_be :valid?
  end

  it "must have at least one category" do
    build_stubbed(:post, categories: []).wont_be :valid?
  end

  it "must resolve if is post localized" do
    I18n.stubs(:locale).returns(:cs)
    create(:post, translations: [build(:post_translation, title: 'Unique 1', locale: :cs)]).localized?.must_equal true
    # I18n.stubs(:locale).returns(:en)
    # create(:post, translations: [build(:post_translation, title: 'Unique 1', locale: :cs)]).localized?.wont_equal true
  end
end