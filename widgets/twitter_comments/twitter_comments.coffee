class Dashing.TwitterComments extends Dashing.Widget

  @accessor 'tweet-text', ->
    "“#{@get('current-twitter-comment')?.body}”"

  ready: ->
    @currentIndex = 0
    @twitterCommentElem = $(@node).find('.comment-container')
    @nextComment()
    @startCarousel()

  onData: (data) ->
    @currentIndex = 0

  startCarousel: ->
    setInterval(@nextComment, 8000)

  nextComment: =>
    twitter_comments = @get('twitter_mentions')
    debugger
    if twitter_comments
      @twitterCommentElem.fadeOut =>
        @currentIndex = (@currentIndex + 1) % twitter_comments.length
        @set 'current-twitter-comment', twitter_comments[@currentIndex]
        @twitterCommentElem.fadeIn()
