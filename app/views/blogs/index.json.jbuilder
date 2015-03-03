json.array!(@blogs) do |blog|
  json.extract! blog, :id, :title, :description, :created_at
  json.url blog_url(blog, format: :json)
end
