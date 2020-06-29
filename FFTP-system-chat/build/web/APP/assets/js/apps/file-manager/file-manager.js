$("#editor").on("keydown keyup", function(e){
    //if (e.keyCode == 32){
        alert("tyk sym i 6te redaktiram");
        var text = $(this).text().replace(/[\s]+/g, " ").trim();
        var word = text.split(" ");
        var newHTML = "";

        $.each(word, function(index, value){
            switch(value){
                case "package":
                case "public":
                case "static":
                case "boolean":
                case "int":
                case "main(":
                case "true":
                case "false":
                case "if":
                case "for":
                case "while":
                    newHTML += "<span style='color:#000080;font-weight:bold'>" + value +"&nbsp</span>";
                    break;
                case "//":
                    newHTML += "<span style='color:gray;font-weight:bold'>" + value +"&nbsp</span>";
                    break;
                default:
                    newHTML += "<span style='color: black'>" + value + "&nbsp;</span>";
            }
        });
      	$(this).html(newHTML);

        //Set cursor postion to end of text
        var child = $(this).children();
        var range = document.createRange();
        var sel = window.getSelection();
        range.setStart(child[child.length - 1], 1);
        range.collapse(true);
        sel.removeAllRanges();
        sel.addRange(range);
        $(this)[0].focus();

    //}
});


$('#button-copy').click( function(){
  var code = $('editor');
  code.select();
  document.execCommand('Copy');
  alert('copy'+code);
});
