require 'jekyll'

class AutoLinkUrls < Jekyll::Converters::Markdown
  def convert(content)
    # Use the default Markdown converter first
    content = super(content)

    # Regex to match plain URLs (not already inside <a> tags)
    url_pattern = %r{(?<!href=["'])\bhttps?://[^\s<]+}

    # Replace plain URLs with anchor tags
    content.gsub(url_pattern) { |url| "<a href=\"#{url}\" target=\"_blank\">#{url}</a>" }
  end
end
