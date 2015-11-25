function addServerDirectory(directory) {
    var p = document.getElementById("server-directory");
    p.textContent = directory;
}
function removeServerDirectory(directory) {
    var p = document.getElementById("server-directory");
    p.textContent = "No directory set.";
}