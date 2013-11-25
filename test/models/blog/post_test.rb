require "test_helper"

describe Blog::Post do
  let(:post)          { build_stubbed(:post) }

  it "default must be valid" do
    post.must_be :valid?
  end

  it "must have title as default to_s result" do 
    "#{post.translation}".must_equal post.translation.title
  end

  it "must have at least one translation" do
    build_stubbed(:post, translations: []).wont_be :valid?
  end

  it "must have at least one category" do
    build_stubbed(:post, categories: []).wont_be :valid?
  end

  it "must work with multiple locales" do 
    translations = [ build(:post_translation, locale: :cs), build(:post_translation) ]
    localized = create(:post, translations: translations)
    localized.translations.where(locale: :en).wont_equal nil
    localized.translations.where(locale: :cs).wont_equal nil
  end
end