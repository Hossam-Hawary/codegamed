/**
 * Created by hossam on 19/05/16.
 */
var myCodeMirror = CodeMirror(document.getElementById("codeEditing"), {
    value: "function myfun(){\n//do something();\n}",
    mode:"text/x-java",
    lineNumbers: true,
    theme:"vibrant-ink"

})
var mac = CodeMirror.keyMap.default == CodeMirror.keyMap.macDefault;
CodeMirror.keyMap.default[(mac ? "Cmd" : "Ctrl") + "-Space"] = "autocomplete";

