class Github
  def self.respositories(query)
    response = Faraday.get("https://api.github.com/search/repositories?q=#{query}")

    if response.status == 200
      { success: true, data: JSON.parse(response.body) }
    else
      { success: false }
    end
  end
end