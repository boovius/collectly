$(document).ready(function(){
  $('.favorite').hover(function(){
    $(this).find('i').toggleClass('gold');
  });

  $('.favorite').click(function(e){
    e.preventDefault();

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
        $(that).find('i').css('color', data.color);
      },
      error: function(data){
        toastr.error('sorry favorite did not update');
      },
      dataType: 'json',
    })
  });
});
