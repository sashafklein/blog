module ApplicationHelper
  def markdown(text)
    markdown_renderer.render text
  end

  def markdown_renderer
    Redcarpet::Markdown.new(renderer, extensions = {})
  end
end
