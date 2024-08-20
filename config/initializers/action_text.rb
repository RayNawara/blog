# config/initializers/action_text.rb

Rails.application.config.after_initialize do
  # Get the default allowed tags and attributes from the HTML5 sanitizer
  default_allowed_attributes = Rails::HTML5::SafeListSanitizer.allowed_attributes + ActionText::Attachment::ATTRIBUTES.to_set

  # Add your custom allowed attributes
  custom_allowed_attributes = Set.new(%w[controls data-controller role style])

  # Merge and freeze the allowed attributes
  ActionText::ContentHelper.allowed_attributes = (default_allowed_attributes + custom_allowed_attributes).freeze

  # Get the default allowed tags from the HTML5 sanitizer
  default_allowed_tags = Rails::HTML5::SafeListSanitizer.allowed_tags + Set.new([ActionText::Attachment.tag_name, "figure", "figcaption"])

  # Add your custom allowed tags
  custom_allowed_tags = Set.new(%w[audio video source])

  # Merge and freeze the allowed tags
  ActionText::ContentHelper.allowed_tags = (default_allowed_tags + custom_allowed_tags).freeze
end
