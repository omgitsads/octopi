module Octopi
  class Comment < Base
    attr_accessor :content, :author, :title, :updated, :link, :published, :id
    include Resource
    set_resource_name "tree"

    resource_path "/tree/show/:id"

    def self.find(opts={})
      user, repo, branch, sha = gather_details(opts)
      self.validate_args(sha => :sha, user => :user, repo => :repo)
      super [user, repo, sha] 
    end  
  end
end