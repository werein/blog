xml.instruct! :xml, version: "1.0"
xml.rss version: "2.0" do
  xml.channel do
    xml.title "Posts"
    xml.link blog_posts_url
    xml.description "Were in RSS"
    xml.language "cs"
    xml.pubDate Time.now.to_s(:rfc822)
    xml.webMaster "ales.horak@imin.cz (Ales Horak)"

    @posts.each do |post|
      xml.item do
        xml.title post.name
        xml.link blog_post_url(post)
        xml.description post.content.truncate(255)
        xml.pubDate post.created_at.to_s(:rfc822)
        xml.guid post_url(post)
      end
    end
  end
end
