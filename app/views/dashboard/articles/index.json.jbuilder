json.array!(@dashboard_articles) do |dashboard_article|
  json.extract! dashboard_article, :id
  json.url dashboard_article_url(dashboard_article, format: :json)
end
