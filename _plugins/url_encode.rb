require 'uri'

module Jekyll
  module URLEncoding
    def url_encode(input)
      return URI.escape(input, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))
    end
  end
end

Liquid::Template.register_filter(Jekyll::URLEncoding)
