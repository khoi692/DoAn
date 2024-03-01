<%-- 
    Document   : post_detail
    Created on : May 25, 2023, 1:14:46 AM
    Author     : Drag
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Post Detail</title>
        <script src="https://kit.fontawesome.com/619ea8ba83.js" crossorigin="anonymous"></script>
        <script src="https://cdn.tiny.cloud/1/1av0a73jyrgplhelvxy6f5t7qdlywvt9j6kvpwh1nyjjnm11/tinymce/6/tinymce.min.js" referrerpolicy="origin"></script>
        <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="../css/ruang-admin.min.css" rel="stylesheet">
        <style>
            html, body {
                margin: 0;
                padding: 0;
            }

            .content {
                padding: 20px;
                background-color: #e8e9ef;
                flex-grow: 1;
            }

            #thumbnail-preview {
                max-width: 100%;
                max-height: 200px;
            }

            form {
                background-color: white;
                padding: 25px;
            }

            input {
                width: 100%;
            }
            #wrapper {
                display: flex;
            }
            .content-margin {

                margin: 20px;
            }
        </style>
    </head>
    <body>
        <div class="content">
            <div class="content-margin">
                <form action="/cozastore/post/detail" method="POST" enctype="multipart/form-data">
                    <label>Status</label><br>
                    <select name="status">
                        <option value="1" 
                                <c:if test="${sessionScope.blog.isStatus()}">
                                    selected
                                </c:if>
                                >Available</option>
                        <option value="0"
                                <c:if test="${!sessionScope.blog.isStatus()}">
                                    selected
                                </c:if>
                                >Hidden</option>
                    </select><br>
                    <label for="title">Title:</label><br>
                    <input required type="text" id="title" name="title" value="${sessionScope.blog.getTitle()}" style="width: 100%"><br><br>
                    <label for="summary">Summary:</label><br>
                    <input required type="text" id="summary" name="summary" value="${sessionScope.blog.getSummary()}" style="width: 100%"><br><br>
                    <label for="tag">Tag:</label><br>
                    <input required type="text" id="tag" name="tag" value="${sessionScope.blog.getTag()}" style="width: 100%"><br><br>
                    <label for="thumbnail">Thumbnail:</label><br>
                    <input type="file" id="thumbnail" name="thumbnail"><br><br>
                    <img id="thumbnail-preview" src="${sessionScope.blog.thumbnail}" onerror="this.src='../images/blog_thumbnail/err_message.jpg'" alt="Thumbnail Preview" style="padding-bottom: 10px">
                    <br/>
                    <label for="content">Content:</label><br>
                    <div style="border: 1px solid black">
                        <textarea id="editor" style="height: auto; min-height: 1000px; width: 100%"></textarea>
                    </div>
                    <input type="hidden" name="editorData" id="editorData">
                    <input type="submit" value="Update Post" style="width: auto">
                </form>
            </div>
        </div>
    </body>
    <script>
        // Get a reference to the textarea element
        const textarea = document.querySelector('#editor');

        // Set the overflow property to hidden and the height property to auto
        textarea.style.overflow = 'hidden';
        textarea.style.height = 'auto';

        // Add an event listener to the textarea that listens for input events
        textarea.addEventListener('input', () => {
            // Update the height of the textarea to match its scrollHeight
            textarea.style.height = `${textarea.scrollHeight}px`;
        });
    </script>

    <script>
        let content = '${sessionScope.blog.getContent()}';
        document.querySelector('#editor').value = content;
                tinymce.init({
                    selector: 'textarea',
                    plugins: 'anchor autolink charmap codesample emoticons image link lists media searchreplace table visualblocks wordcount checklist mediaembed casechange export formatpainter pageembed linkchecker a11ychecker tinymcespellchecker permanentpen powerpaste advtable advcode editimage tinycomments tableofcontents footnotes mergetags autocorrect typography inlinecss',
                    toolbar: 'undo redo | blocks fontfamily fontsize | bold italic underline strikethrough | link image table mergetags | addcomment showcomments | spellcheckdialog a11ycheck typography | align lineheight | checklist numlist bullist indent outdent | emoticons charmap | removeformat',
                    tinycomments_mode: 'embedded',
                    tinycomments_author: 'Author name',
                    mergetags_list: [
                        {value: 'First.Name', title: 'First Name'},
                        {value: 'Email', title: 'Email'}
                    ],
                    /* enable title field in the Image dialog*/
                    image_title: true,
                    /* enable automatic uploads of images represented by blob or data URIs*/
                    automatic_uploads: true,
                    /*
                     URL of our upload handler (for more details check: https://www.tiny.cloud/docs/configure/file-image-upload/#images_upload_url)
                     images_upload_url: 'postAcceptor.php',
                     here we add custom filepicker only to Image dialog
                     */
                    images_upload_url: '../upload',
                    file_picker_types: 'image',
                    /* and here's our custom image picker*/
                    file_picker_callback: (cb, value, meta) => {
                        const input = document.createElement('input');
                        input.setAttribute('type', 'file');
                        input.setAttribute('accept', 'image/*');

                        input.addEventListener('change', (e) => {
                            const file = e.target.files[0];

                            const reader = new FileReader();
                            reader.addEventListener('load', () => {
                                /*
                                 Note: Now we need to register the blob in TinyMCEs image blob
                                 registry. In the next release this part hopefully won't be
                                 necessary, as we are looking to handle it internally.
                                 */
                                const id = 'blobid' + (new Date()).getTime();
                                const blobCache = tinymce.activeEditor.editorUpload.blobCache;
                                const base64 = reader.result.split(',')[1];
                                const blobInfo = blobCache.create(id, file, base64);
                                blobCache.add(blobInfo);

                                /* call the callback and populate the Title field with the file name */
                                cb(blobInfo.blobUri(), {title: file.name});
                            });
                            reader.readAsDataURL(file);
                        });

                        input.click();
                    },
                    content_style: 'body { font-family:Helvetica,Arial,sans-serif; font-size:16px } img {max-width: 50%; height: auto;}'
                });
    </script>

    <script>
        document.querySelector('form').addEventListener('submit', function (event) {
            // Get the content of the TinyMCE editor
            const content = tinymce.activeEditor.getContent();

            // Set the value of the hidden input field to the content of the editor
            document.querySelector('#editorData').value = content;
        });

    </script>

    <script>
        document.querySelector('#thumbnail').addEventListener('change', function (event) {
            const file = event.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function (e) {
                    document.querySelector('#thumbnail-preview').src = e.target.result;
                    document.querySelector('#thumbnail-preview').style.display = 'block';
                };
                reader.readAsDataURL(file);
            } else {
                document.querySelector('#thumbnail-preview').src = '#';
                document.querySelector('#thumbnail-preview').style.display = 'none';
            }
        });
    </script>
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</html>
