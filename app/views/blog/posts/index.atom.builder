atom_feed do |feed|
  feed.title "Posts"
  feed.updated Time.now

  @posts.each do |post|
    feed.entry(post) do |entry|
      entry.url blog_post_url(post)
      entry.title post.name
      entry.content post.content, :type => 'html'

      # the strftime is needed to work with Google Reader.
      entry.updated(post.created_at.strftime("%Y-%m-%dT%H:%M:%SZ"))
    end
  end
end