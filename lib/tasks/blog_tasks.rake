# desc "Explaining what the task does"
# task :blog do
#   # Task goes here
# end

namespace :blog do
  namespace :post do 
    desc "Regenerate all images on post"
    task recreate_versions: :environment do 
      Blog::Post.all.each do |i|
        if i.image? and i.image.file.exists?
          i.process_image_upload = true
          i.image.recreate_versions!
        end
      end
    end
  end

  namespace :category do 
    desc "Regenerate all images on category"
    task recreate_versions: :environment do 
      Blog::Category.all.each do |i|
        if i.image? and i.image.file.exists?
          i.process_image_upload = true
          i.image.recreate_versions!
        end
      end
    end
  end
end