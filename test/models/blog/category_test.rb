require "test_helper"

describe Blog::Category do
  let(:category)      { build_stubbed(:category) }

  it "default must be valid" do
    category.must_be :valid?
  end

  it "must have title as default to_s result" do 
    "#{category.translation}".must_equal category.translation.title
  end

  it "must work without parent category" do 
    build_stubbed(:category, parent: nil).must_be :valid?
  end

  it "must be hierarchy" do 
    parent = create(:category)
    child  = create(:category, parent: parent)
    child.root.must_equal parent
    parent.children.wont_be :empty?
    parent.children.include?(child).must_equal true
  end

  it "must work with multiple locales" do 
    translations = [ build(:category_translation, locale: :cs), build(:category_translation) ]
    localized = create(:category, translations: translations)
    localized.translations.where(locale: :en).wont_equal nil
    localized.translations.where(locale: :cs).wont_equal nil
  end
end