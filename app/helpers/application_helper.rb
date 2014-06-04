module ApplicationHelper
  def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts << "Tickets").join(" - ")
      end
    end
  end
end
