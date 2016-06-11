/**
 * Created by hossam on 29/05/16.
 */

myCodeMirror = CodeMirror(document.getElementById("codeEditing"), {
    mode:"text/x-java",
    lineNumbers: true,
    theme:"dracula",indentUnit:4,
    matchBrackets:true,
    styleActiveLine:false,
    autoCloseBrackets:true,
    highlightSelectionMatches: {showToken: /\w/, annotateScrollbar: true},
    styleSelectedText: false,
    scrollbarStyle: "overlay", //or "simple"
})
var mac = CodeMirror.keyMap.default == CodeMirror.keyMap.macDefault;
CodeMirror.keyMap.default[(mac ? "Cmd" : "Ctrl") + "-Space"] = "autocomplete";
