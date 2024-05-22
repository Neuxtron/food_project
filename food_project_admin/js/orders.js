const orders = [...document.getElementsByClassName("order")]

orders.forEach(order => {
  const id = order.classList[order.classList.length - 1]
  order.addEventListener("click", () => {
    location.href = `./detail_order.php?id=${id}`
  })
})