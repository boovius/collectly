$(document).ready(function(){
  $('.favorite').click(function(e){
    e.preventDefault();
    var mediaType = $(this).data('media-type');
    var mediaId = $(this).data('media-id');
    console.log('clicked');
    console.log(mediaType);
    console.log(mediaId);

    var postData = {
      mediaType: mediaType,
      mediaId: mediaId
    }

    $.ajax({
      type: 'POST',
      url: '/favorites',
      data: postData,
      success: function(data){
        console.log('success!!');
        console.log(data);
      },
      dataType: 'json',
    })
  });
});
