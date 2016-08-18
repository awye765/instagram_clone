$( document ).ready(function() {
// Wait for the document to be ready BEFORE running the code.
  $('.more-comments').click( function() {
// LISTEN for a CLICK event on the more-comments classes.  There may be multiple
// more-comments classes depending on how many posts have multiple comments.
    $(this).on('ajax:success', function(event, data, status, xhr) {
// Once AJAX call SUCCESSFUL, move on to the next lines below.
      var postId = $(this).data("post-id");
// Assign a postId variable based on the contents of the data-post-id html
// attribute.
      $("#comments_" + postId).html(data);
// REPLACE the #comments_ + postId div with the contents of the returned AJAX
// data.
      $("#comments-paginator-" + postId).html("<a id='more-comments' data-post-id=" + postId + "data-type='html' data-remote='true' href='/posts/" + postId + "/comments>show more comments</a>");
    });
  });
});
