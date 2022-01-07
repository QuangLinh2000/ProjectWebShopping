//hover all list cart-item-save
const listSave = document.querySelectorAll(".cart-item-save");
listSave.forEach((element) => {
  element.addEventListener("mouseover", () => {
    element.querySelector(".fa-heart").className = "fa-solid fa-heart";
  });
  // event hover
});
//event list save hover
listSave.forEach((element) => {
  element.addEventListener("mouseout", () => {
    element.querySelector(".fa-heart").className = "fa-regular fa-heart";
  });
});

//animation remove item
let listBtnRemove = document.querySelectorAll(".btn-remover");
listBtnRemove.forEach((element) => {
  element.addEventListener("click", () => {
    element.closest(".cart-item").classList.add("products--delete");
    setTimeout(() => {
      element.closest(".cart-item").remove();
    }, 500);
  });
});
