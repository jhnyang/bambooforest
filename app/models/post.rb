class Post < ActiveRecord::Base
    has_many :comments, -> { order('created_at DESC') }
    
    def self.idsearch(search)
      if search
        find(:all, :conditions => ['id LIKE ?', "%#{search}%"])
      else
        find(:all)
      end
    end
    
    def self.search(search)
      if search
        find(:all, :conditions => ['content LIKE ?', "%#{search}%"])
      else
        find(:all)
      end
    end
    
    def self.tagsearch(search)
      if search
        find(:all, :conditions => [' LIKE ?', "%#{search}%"])
      else
        find(:all)
      end
    end
    
end
