const sidebar = document.getElementById("sidebar");
const openBtn = document.getElementById("openBtn");
const content = document.getElementById("mainContent");

function closeSidebar(){
    sidebar.classList.add("closed");
    content.classList.add("full");
    openBtn.style.display = "flex";
}

function openSidebar(){
    sidebar.classList.remove("closed");
    content.classList.remove("full");
    openBtn.style.display = "none";
}
document.addEventListener("DOMContentLoaded", function () {

    const sidebar = document.getElementById("sidebar");
    const openBtn = document.getElementById("openSidebar");

    // CEK ELEMENT (ANTI ERROR)
    if (!sidebar || !openBtn) {
        console.error("Sidebar / Button tidak ditemukan!");
        return;
    }

    // BUKA SIDEBAR
    openBtn.addEventListener("click", function () {
        sidebar.classList.toggle("active");
    });

    // TUTUP SIDEBAR JIKA KLIK LUAR
    document.addEventListener("click", function (e) {
        if (
            sidebar.classList.contains("active") &&
            !sidebar.contains(e.target) &&
            !openBtn.contains(e.target)
        ) {
            sidebar.classList.remove("active");
        }
    });

});
