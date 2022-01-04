//modal close dom
const modalCart = document.getElementById('modal-cart');
function closeModal() {
    modalCart.style.display = "none";
}
function openModal() {
    modalCart.style.display = "flex";
}
//modal close over modal
//modal close on click outside
modalCart.addEventListener('click', function (event) {
    if (event.target === modalCart) {
        modalCart.style.display = "none";
    }
});
//windowns load dom
document.querySelectorAll('.product-list-size').forEach(element => {
    element.addEventListener('click', function () {
        this.classList.toggle('active');
    });
});