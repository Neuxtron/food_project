const queryString = window.location.search;
const urlParams = new URLSearchParams(queryString);
const message = urlParams.get("msg")
const error = document.getElementById("error")

if (message !== null) {
  error.innerText = message
}