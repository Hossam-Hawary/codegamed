/**
 * Created by hossam on 23/05/16.
 */
$('#badge_image_url').bind('change', function() {
    var size_in_megabytes = this.files[0].size/1024/1024;
    if (size_in_megabytes > 2) {
        alert('Maximum file size is 2MB. Please choose a smaller file.');
        $('#badge_image_url').val("");
    }
});
