$ ->
  $('.card-share > a').on 'click', (e) ->
    e.preventDefault()
    # prevent default action - hash doesn't appear in url
    $(this).parent().find('div').toggleClass 'card-social--active'
    $(this).toggleClass 'share-expanded'
    return
  return
