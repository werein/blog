atom_feed do |feed|
  feed.title 'Posts'
  feed.updated Time.now

  @posts.each do |post|
    feed.entry(post) do |entry|
      entry.url blog.post_url(post)
      entry.title post.name
      entry.content post.content, type: 'html'

      entry.updated(post.created_at.strftime("%Y-%m-%dT%H:%M:%SZ"))
    end
  end
end