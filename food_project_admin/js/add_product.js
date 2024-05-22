const gambarInput = document.getElementById("gambar")
const gambarHolder = document.getElementById("gambar-holder")
const submitBtn = document.getElementById("submit")
const addForm = document.getElementById("add-form")

const listGambar = []

gambarInput.addEventListener("change", async () => {
  const gambar = gambarInput.files[0]
  const nama = gambar.name
  const response = await fetch(`./gambar_item.php?nama=${nama}`)
  const gambarItem = await response.text()
  gambarHolder.innerHTML += gambarItem
  listGambar.push(gambar)
})

submitBtn.addEventListener("click", async () => {
  const id = await editProduct()
  if (id === null) return

  const formData = new FormData();
  formData.append("id", id)
  listGambar.forEach((gambar, index) => {
    formData.append(index, gambar)
  })
  fetch('./actions/upload_gambar.php', {
    method: "POST",
    body: formData,
  });

  location.href = "./all_products.php"
})

async function editProduct() {
  const formData = new FormData(addForm)
  const response = await fetch("./actions/add_product.php", {
    method: "POST",
    body: formData,
  })
  const data = await response.json()
  return data.id
}