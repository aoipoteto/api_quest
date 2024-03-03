class Article < ApplicationRecord

    self.primary_key = 'slug'
    
    before_save :generate_slug

    def generate_slug
        self.slug = self.title.parameterize if title.present?
    end

    def to_params
        slug
    end
end

# class Article < ApplicationRecord

#     self.primary_key = 'slug'

#     before_validation :generate_slug, if: -> { title.present? && slug.blank? }


#     def generate_slug
#         self.slug = self.title.parameterize
#     end

# end

