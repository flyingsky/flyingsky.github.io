require 'jekyll'

class AutoLinkUrls < Jekyll::Converters::Markdown
  def convert(content)
    # Use the default Markdown converter first
    content = super(content)

    # Regex to match bare URLs NOT inside href= or src= (within <a> or <img>)
    url_pattern = %r{
      (?<!["'=])               # Negative lookbehind to avoid catching inside href=" or src='
      (?<!href=)               # Prevent inside href=
      (?<!src=)                # Prevent inside src=
      \bhttps?://[^\s<>"')]+   # Match URL
    }x

    # Replace plain URLs with anchor tags
    content.gsub(url_pattern) do |url|
      # Trim punctuation like .,?,!, and ; from the URL for the <a> tag
      clean_url = url.gsub(/[.,!?;)]$/, '')

      # Replace the URL with an anchor tag, keeping the punctuation in the display text
      "<a href=\"#{clean_url}\" target=\"_blank\">#{url}</a>"
    end
  end
end
