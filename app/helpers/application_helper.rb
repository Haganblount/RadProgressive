module ApplicationHelper
  def header_link(title, path, opts = {})
    opts[:li] ||= { }
    opts[:li][:class] = "#{opts[:li][:class]} " + (request.path == path ? 'active' : '')
    content_tag :li, link_to(title, path, opts[:link]), opts[:li]
  end
end
