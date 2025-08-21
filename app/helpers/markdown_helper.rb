# app/helpers/markdown_helper.rb
module MarkdownHelper
  def md(text)
    return "" if text.blank?

    input = defined?(Kramdown::Parser::GFM) ? "GFM" : "kramdown"
    html = Kramdown::Document.new(text, input: input).to_html

    sanitize(
      html,
      tags: %w[p br strong em a code pre ul ol li h1 h2 h3 h4 h5 h6 blockquote hr],
      attributes: %w[href title]
    ).html_safe
  end
end
