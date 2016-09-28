json.array!(@dashboard_disciplines) do |dashboard_discipline|
  json.extract! dashboard_discipline, :id
  json.url dashboard_discipline_url(dashboard_discipline, format: :json)
end
