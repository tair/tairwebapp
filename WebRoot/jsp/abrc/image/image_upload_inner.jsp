<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<link rel="stylesheet" type="text/css" href="/css/main.css" />

<script type="text/javascript">
function addRow() {
    //increase filecount and save it to a variable
    var count = parseInt(document.getElementById("filecount").value);
    document.getElementById("filecount").value =count + 1;
    
    var table = document.getElementsByTagName("TBODY").item(3);
    var row=document.createElement("TR");
    row.setAttribute("align", "center");
    var cell=document.createElement("TD");
    var imageInput = document.createElement("input");
    var filename="uploadfile" + (count+1);
    var previous_filename = "uploadfile" + count;
    var prev_imageInput = document.getElementById(previous_filename);
    imageInput.setAttribute("type","file");
    imageInput.setAttribute("size","50");
    imageInput.setAttribute("name",filename);
    imageInput.setAttribute("id",filename);
    prev_imageInput.setAttribute("onchange","");
    imageInput.setAttribute("onchange","addRow();");
    cell.appendChild(imageInput);
    row.appendChild(cell);
    table.appendChild(row);
}

</script>

<input id="filecount" type="hidden" value="1">

<form method="post" name="BulkUpload" action="/servlets/processor?update_action=upload_files&type=image" target="_blank" enctype="multipart/form-data">
    <input type="hidden" name="todo" value="upload" />

<table align="center" border="0" cellpadding="2" width="100%">
    <tr>
    <td align="center" nowrap><font class="mainheader">Bulk Image Loader</font></td>
    </tr>
</table>

<table align="center" border="0" cellpadding="2" width="100%">
    <tr>
    <td align="center"> <br><b>Select Image Type : </b><br>
        <select name="image_type">
            <option value="scanned_image">Scanned Image</option>
            <option value="photograph">Photograph</option>
            <option value="diagram">Diagram</option>
            <option value="graph">Graph</option>
        </select>
    </td>
    </tr><tr>
    <td align="center"><br><b>Enter an Image Description (optional) : </b><br>
        <textarea rows="2" cols="70" name="description"></textarea>
    </td>
    </tr>
</table>

<table name = "files" align="center" border ="0" cellpadding ="2" width="80%">
    <tr>
    <td align="center"><br><b> Select an image to upload (supported types : .gif, .jpg, .tif, .bmp) :<b></td>
    <tr>

    <tbody>
    <tr>
        <td align="center"><input id="uploadfile1" type="file" name="uploadfile1" size="50" onchange="addRow(); return false;"></td>
    </tr>
    </tbody>
</table>
<table align="center" width="80%">
    <tr>
    <td align="center"><button onClick="addRow(); return false;"> Add Another Image </button> 
    &nbsp; <input type="reset"></input>
    &nbsp; <input type="submit" value="Upload"></input></td>
    
    </tr>
</table>
</form>

