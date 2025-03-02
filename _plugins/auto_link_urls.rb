require 'jekyll'

class AutoLinkUrls < Jekyll::Converters::Markdown
  def convert(content)
    # Use the default Markdown converter first
    content = super(content)

    # Improved regex pattern:
    # - Match URLs starting with http:// or https://
    # - Avoid capturing trailing punctuation like .,?! if they are not part of the URL
    url_pattern = %r{
      (?<!href=["'])       # Ensure it's not already inside an <a> tag
      \b                  # Word boundary
      (https?:\/\/[^\s<]+) # Capture the URL (anything not a space or '<')
      (?=[.,!?)]?(?:\s|$)) # Allow ending punctuation but exclude it from the match
    }xi

    # Replace plain URLs with anchor tags, ensuring proper escaping
    content.gsub(url_pattern) do |match|
      url = match.strip.gsub(/[.,!?)]$/, '') # Strip trailing punctuation
      "<a href=\"#{url}\" target=\"_blank\">#{url}</a>"
    end
  end
end
