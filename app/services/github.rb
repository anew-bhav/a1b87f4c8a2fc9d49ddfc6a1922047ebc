class Github
  def self.respositories(query, per_page = 10, page)
    response = Faraday.get("https://api.github.com/search/repositories?q=#{query}&per_page=#{per_page}&page=#{page}")

    if response.status == 200
      { success: true, data: JSON.parse(response.body) }
    else
      { success: false, error: JSON.parse(response.body) }
    end
  end
end