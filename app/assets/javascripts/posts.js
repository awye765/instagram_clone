var loadFile = function(event) {
  var output = document.getElementById('image-preview');
  output.src = URL.createObjectURL(event.target.files[0]);
};

// On change, we grab the 'image-preview' element and change it's src attribute
// to the file path of our input.  This displays the chosen preview image to
// to that image which the user wishes to upload.
