require 'jekyll'

class AutoLinkUrls < Jekyll::Converters::Markdown
  def convert(content)
    # Use the default Markdown converter first
    content = super(content)

    # Improved regex pattern:
    # - Matches URLs starting with http(s):// or www.
    # - Allows valid URL characters including ?, =, &, /
    # - Excludes trailing punctuation that is not part of the URL
    url_pattern = %r{
      (?<!href=["'])         # Ensure it's not already inside an <a> tag
      \b                    # Word boundary
      (                     # Capture group for the URL
        (?:https?:\/\/|www\.) # Match http://, https://, or www.
        [^\s<>()\[\]{}]+     # Match valid URL characters (no spaces or brackets)
        [^\s.,!?)]           # Ensure URL does NOT end in .,!?)
      )                     # End capture group
    }xi

    # Replace plain URLs with anchor tags
    content.gsub(url_pattern) do |url|
      # Add "http://" if the URL starts with "www."
      url = "http://#{url}" if url.start_with?("www.")

      "<a href=\"#{url}\" target=\"_blank\">#{url}</a>"
    end
  end
end
