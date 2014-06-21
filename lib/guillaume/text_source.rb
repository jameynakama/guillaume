require "uri"

class Guillaume::TextSource
  attr_accessor :plaintext, :source

  def initialize(url_or_string)
    @source = url_or_string
    if @source =~ /\A#{URI::regexp(['http', 'https'])}\z/
      @plaintext = text_from_url(@source)
    else
      @plaintext = @source
    end
  end

  private

  def text_from_url(url)
    url = URI.parse(url)
    req = Net::HTTP::Get.new(url.path)
    Net::HTTP::start(url.host, url.port) do |http|
      http.request(req)
    end.body
  end
end
