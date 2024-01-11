class Article < ApplicationRecord

    def self.search(search)
        # search from within redis
        # if not found, search from within db
        #then cache to redis
        print "searching for #{search}"
        if !search.blank?

            #save the search term to redis by an IP address

            where("title LIKE ?", "%#{search}%")
        else
            all
        end
    end

end
