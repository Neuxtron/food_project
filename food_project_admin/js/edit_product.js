const gambarInput = document.getElementById("gambar")
const gambarHolder = document.getElementById("gambar-holder")
const submitBtn = document.getElementById("submit")
const deleteBtn = document.getElementById("delete")
const editForm = document.getElementById("edit-form")

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
  editProduct()

  const formData = new FormData();
  formData.append("id", idProduct)
  listGambar.forEach((gambar, index) => {
    formData.append(index, gambar)
  })
  await fetch('./actions/upload_gambar.php', {
    method: "POST",
    body: formData,
  });

  location.href = "./all_products.php"
})

async function editProduct() {
  const formData = new FormData(editForm)
  const response = await fetch("./actions/edit_product.php", {
    method: "POST",
    body: formData,
  })
  const data = await response.json()
  return data.id
}

deleteBtn.addEventListener("click", () => {
  location.href = `./actions/delete_product.php?id=${idProduct}`
})