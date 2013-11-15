require "test_helper"

describe Blog::Category do
  before do 
    I18n.available_locales = [:en, :cs, :de]
  end

  let(:category)      { build_stubbed(:category) }
  let(:translation)   { build_stubbed(:category_translation) }

  it "default must be valid" do
    category.must_be :valid?
  end

  it "must have title as default to_s method" do 
    "#{category.translation}".must_equal category.translation.title
  end

  it "must generate parent enum" do 
    category.parent_enum.must_equal []
  end

  it "must resolve if is post localized" do
    I18n.stubs(:locale).returns(:cs)
    create(:post, translations: [build(:post_translation, locale: :cs)]).localized?.must_equal true
  end

  it "must resolve if is category localized" do
    I18n.stubs(:locale).returns(:cs)
    create(:category, translations: [build(:category_translation, locale: :cs)]).localized?.must_equal true
    # I18n.stubs(:locale).returns(:en)
    # create(:category, translations: [build(:category_translation, locale: :cs)]).localized?.wont_equal true
  end
end