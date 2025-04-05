require 'jekyll'

class AutoLinkUrls < Jekyll::Converters::Markdown
  def convert(content)
    # Use the default Markdown converter first
    content = super(content)

    # Regex to match plain URLs (not already inside <a> or <img> tags)
    url_pattern = %r{(?<!\b(?:href|src)=["'])\bhttps?://[^\s<]+}

    # Replace plain URLs with anchor tags
    content.gsub(url_pattern) do |url|
      # Trim punctuation like .,?,!, and ; from the URL for the <a> tag
      clean_url = url.gsub(/[.,!?;)]$/, '')

      # Replace the URL with an anchor tag, keeping the punctuation in the display text
      "<a href=\"#{clean_url}\" target=\"_blank\">#{url}</a>"
    end
  end
end
