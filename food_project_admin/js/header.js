const overlay = document.getElementById("logout-overlay")
const logoutSection = document.getElementById("logout-section")
const logoutBtn = document.getElementById("logout-btn")

overlay.addEventListener("click", () => {
  logoutSection.style.visibility = "hidden"
})
logoutBtn.addEventListener("click", () => {
  logoutSection.style.visibility = "visible"
  console.log("AAAAAAAAA")
})