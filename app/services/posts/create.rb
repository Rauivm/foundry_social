module Posts
  class Create
    Result = Struct.new(:success?, :post, :error, keyword_init: true)

    def self.call(user:, character:, content:)
      new(user:, character:, content:).call
    end

    def initialize(user:, character:, content:)
      @user = user
      @character = character
      @content = content
    end

    def call
      return Result.new(success?: false, error: "Select a character before posting.") unless character
      return Result.new(success?: false, error: "Unauthorized character.") unless character.user_id == user.id

      post = character.posts.build(content: content)

      if post.save
        Result.new(success?: true, post: post)
      else
        Result.new(success?: false, post: post, error: post.errors.full_messages.to_sentence)
      end
    end

    private

    attr_reader :user, :character, :content
  end
end
