//  slide show
var slideIndex = 1;
function plusDivs(n) {
    showDivs((slideIndex += n));
}

function currentDiv(n) {
    showDivs((slideIndex = n));
}
showDivs(slideIndex);

function showDivs(n) {
    var i;
    var x = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("demo");
    var slideShowa = document.getElementById("ml-slide");
    if (n > x.length || slideIndex > x.length) {
        slideIndex = 1;
    }

    if (n < 1) {
        slideIndex = x.length;
    }
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    var marginL = -(slideIndex - 1) * 100;
    slideShowa.style.marginLeft = `${marginL}` + "vw";

    if (dots[slideIndex - 1]) {
        dots[slideIndex - 1].className += " active";
    }
}
window.onload = function (e) {
    setInterval(() => {
        showDivs(slideIndex++);
    }, 10000);
    // setInterval(() => {
    //     showSlide(++indexSlider);
    // }, 6000);
};

//==========================hover image dom===========================//
const listImageHover = document.querySelectorAll(".img-item-hov");
listImageHover.forEach((element) => {
    element.addEventListener("mouseover", () => {
        element
            .closest(".slide-collection")
            .querySelector(".collection-slide-image").src = element.src;
    });
});

//==========================slider production===========================//
const listNextBtn = document.querySelectorAll(".next-btn");
const listPrevBtn = document.querySelectorAll(".prev-btn");
const listSlideshowCollection = document.querySelectorAll(
    ".slideshow-collection"
);
listSlideshowCollection.forEach((element) => {
    element.style.transform = "translateX(0%)";
});
var countSlide = 2;
listNextBtn.forEach((element) => {
    element.addEventListener("click", () => {
        //window.innerWidth : screen.width
        if (window.innerWidth < 600 || screen.width < 600) {
            countSlide = 1;
        } else {
            countSlide = 2;
        }
        let parentE = element
            .closest(".collection-slide")
            .querySelector(".slideshow-collection");
        let count = parentE.querySelectorAll(".slide-collection").length;
        let percentBefore = parentE.style.transform.replace(/[^-?\d.]/g, "");
        percentBefore = parseInt(percentBefore, 10) - 100 / countSlide;
        if (percentBefore < (-(count - 2) * 100) / countSlide) {
            percentBefore = 0;
        }
        parentE.style.transform = `translateX(${percentBefore}%)`;
    });
});
listPrevBtn.forEach((element) => {
    element.addEventListener("click", () => {
        let parentE = element
            .closest(".collection-slide")
            .querySelector(".slideshow-collection");
        let count = parentE.querySelectorAll(".slide-collection").length;
        let percentBefore = parentE.style.transform.replace(/[^-?\d.]/g, "");
        percentBefore = parseInt(percentBefore, 10) + 50;
        console.log(percentBefore);
        if (percentBefore > 0) {
            percentBefore = -(count - 2) * 50;
        }
        parentE.style.transform = `translateX(${percentBefore}%)`;
    });
});
//==========================section-slider===========================//
const slickNext = document.getElementById("slick-next");
const slickPrev = document.getElementById("slick-prev");
const sectionContent = document.getElementById("section-slideshow");
const listSlider = document.querySelectorAll(".slides-item");

var indexSlider = 1;
slickNext.addEventListener("click", () => {
    showSlide(++indexSlider);
});
slickPrev.addEventListener("click", () => {
    showSlide(--indexSlider);
});
showSlide(1);
function showSlide(n) {
    let isResponsive600 = window.innerWidth < 600 || screen.width < 600;
    if (!isResponsive600 && indexSlider > listSlider.length - 2) {
        indexSlider = 1;
    } else if (isResponsive600 && indexSlider > listSlider.length) {
        indexSlider = 1;
    }
    if (n < 1) {
        indexSlider = listSlider.length - 2;
        if (isResponsive600) {
            indexSlider = listSlider.length;
        }
    }
    listSlider.forEach((element) => {
        element.className = "slides-item";
    });
    var percent = 0;
    if (isResponsive600) {
        percent = -(indexSlider - 1) * 100;
    } else {
        percent = -(indexSlider - 1) * 33.33;
    }
    sectionContent.style.transform = `translateX(${percent}%)`;
    listSlider[indexSlider].className = "slides-item slide-active";
}

//==========================tab-links===========================//
const arrTabLink = document.querySelectorAll(".tablinks");
const listTab1 = document.getElementById("list-tab1");
const listTab2 = document.getElementById("list-tab2");
const listTab3 = document.getElementById("list-tab3");
listTab1.className = "active";
for (let index = 0; index < arrTabLink.length; index++) {
    arrTabLink[index].addEventListener("click", () => {
        arrTabLink.forEach((element) => {
            element.classList.remove("active");
        });
        arrTabLink[index].classList.add("active");
        listTab1.className = "";
        listTab2.className = "";
        listTab3.className = "";

        if (index === 0) {
            listTab1.className = "active";
        }
        if (index === 1) {
            listTab2.className = "active";
        }
        if (index === 2) {
            listTab3.className = "active";
        }
    });
}
//customer active
// const listCustomerItem = document.querySelectorAll(".customer-item");
// listCustomerItem[2].classList.add("active");
// for (let index = 0; index < listCustomerItem.length; index++) {
//     if (index === 2) {
//         continue;
//     }
//     console.log(index);
//     listCustomerItem[index].addEventListener("mouseover", () => {
//         listCustomerItem[2].classList.remove("active");
//     });
//     listCustomerItem[index].addEventListener("mouseout", () => {
//         listCustomerItem[2].classList.add("active");
//     });
// }
