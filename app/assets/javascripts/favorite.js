$(document).ready(function(){
  $('.favorite').click(function(e){
    e.preventDefault();
    console.log('clicked');

    var mediaType = $(this).data('media-type');
    var mediaId = $(this).data('media-id');

    var postData = {
      mediaType: mediaType,
      mediaId: mediaId
    }

    var that = this;
    $.ajax({
      type: 'POST',
      url: '/favorites',
      data: postData,
      success: function(data){
        $(that).css('color', data.color);
      },
      error: function(data){
        alert('sorry favorite did not update');
      },
      dataType: 'json',
    })
  });
});
