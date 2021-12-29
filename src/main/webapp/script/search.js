//==========================hover image dom===========================//
const listImageHover = document.querySelectorAll(".img-item-hov");
listImageHover.forEach((element) => {
  element.addEventListener("mouseover", () => {
    element
      .closest(".slide-collection")
      .querySelector(".collection-slide-image").src = element.src;
  });
});
