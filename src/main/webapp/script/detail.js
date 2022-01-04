


let mainImgTag, mainImg,list, lens, result;
result=document.querySelector(".img-zoom-result")
lens=document.querySelector(".img-zoom-lens")
let amount=1;
let indexOfImage=0;
let indexOfWrapSlide=0;
let numWrapSlide=4;
let listSelect=document.querySelectorAll(".select-image");
//Khởi tạo các sản phẩm liên quan, thay đổi dựa theo base Date

//chỉnh lại view khi kích thước trang thay đổi
let slideWrap=document.querySelector(".wrap__list__box");
function resizeWindow(){
    
if((window.innerWidth>1150)){
    numWrapSlide=4
    replaceClassWrap("wrap__element")
}
else if(window.innerWidth>900){
    numWrapSlide=3
    replaceClassWrap("wrap__element-tablet")
}
else if(window.innerWidth>600) {
    numWrapSlide=2
replaceClassWrap("wrap__element-large-phone")
}
else {
   replaceClassWrap("wrap__element-mobile") ;
   numWrapSlide=1;}
}
resizeWindow();
// điều chỉnh khu vực các sản phẩm liên quan dựa vào class name
function replaceClassWrap(className){
    let wrapElement=slideWrap.getElementsByTagName('li');
    for (let i = 0; i < wrapElement.length ; i++) {
        wrapElement[i].classList=className;
    }
}

// hàm này sẽ chỉnh lại số thành phần trong list các sản phẩm liên quan dựa vào tên class truyền vào


// Kiểm tra xem sản phẩm liên quan có giảm giá hay không

// Kiểm tra có còn hàng hay không 


//chuyển slide các sản phẩm liên quan
function transition(arg,size){
let wrapListBox=document.querySelector(".wrap__list__box");
let wrapListElement=wrapListBox.firstElementChild;

indexOfWrapSlide+=arg;
if(indexOfWrapSlide<0) indexOfWrapSlide=size-numWrapSlide;
if(indexOfWrapSlide>size-numWrapSlide) indexOfWrapSlide=0;
wrapListBox.style.transform='translateX('+(-indexOfWrapSlide * (10 +  wrapListElement.clientWidth))+'px)';

}

// chuyển số tiền thành chuỗi

function changeAmount(sign,available){
let amountLabel=document.querySelector(".amount-num");
if(amount+sign>available) amount=available;
else if(amount+sign<1) amount=1 ;else amount=amount+sign;
amountLabel.innerHTML=amount;
}
// Cài đặt thuộc tính cho thẻ detail information



showList(indexOfImage);
// khởi tạo thuộc tính ban đầu cho thẻ khi mới load trang
    // nhấn ảnh bên trái thì bên phải đổi ảnh
function changeImage(index1,length){
    indexOfImage += index1
    if(indexOfImage>length-2) indexOfImage=0;
    if(indexOfImage<0) indexOfImage=length-2;
    showList(indexOfImage);
}
// sự kiện pull up(down) trong danh sách ảnh
function showList(index1){
    var listImage=document.getElementsByClassName("image__left__item");
    var i;
    if(index1<0) indexOfImage=0;
    if(index1 >= (listImage.length)-1) indexOfImage=listImage.length-2;
    for(i = 0; i < listImage.length; i++) {
        listImage[i].style.display="none";
    }
    listImage[indexOfImage].style.display="block";
    listImage[indexOfImage+1].style.display="block";
}

    // thiết lập righ Image nhờ url
function leftToRightSupport(url){
    const rightImage=document.getElementById("image__right__element--img");

    rightImage.setAttribute("src",url.getAttribute("src"));

}
// zoom ảnh


function imageZoom() {
    var cx, cy;
    cx =3;

    cy = 3;

    mainImg=document.getElementById("image__right__element--img");

    result.style.backgroundImage="url('" + mainImg.getAttribute("src") + "')";

    result.style.backgroundSize = (mainImg.width * cx) + "px " + (mainImg.height * cy) + "px";

      /*execute a function when someone moves the cursor over the image, or the lens:*/
    lens.addEventListener("mousemove", moveLens);
    mainImg.addEventListener("mousemove", moveLens);
     /*and also for touch screens:*/
    lens.addEventListener("touchmove", moveLens);
    mainImg.addEventListener("touchmove", moveLens);


function moveLens(e) {
var pos, x, y;

/*prevent any other actions that may occur when moving over the image:*/
e.preventDefault();
/*get the cursor's x and y positions:*/
pos = getCursorPos(e);
/*calculate the position of the lens:*/
x = pos.x - (lens.offsetWidth / 2);


y = pos.y - (lens.offsetHeight / 2);



/*prevent the lens from being positioned outside the image:*/
if (x > mainImg.width - lens.offsetWidth) {x = mainImg.width - lens.offsetWidth;}
if (x < 0) {x = 0;}
if (y > mainImg.height - lens.offsetHeight) {y = mainImg.height - lens.offsetHeight;}
if (y < 0) {y = 0;}
/*set the position of the lens:*/
lens.style.left = x + "px";
lens.style.top = y + "px";
/*display what the lens "sees":*/
result.style.backgroundPosition = ("-" + (x * cx) + "px -" + (y * cy) + "px");
}
function getCursorPos(e) {
var a, x = 0, y = 0;
e = e || window.event;
/*get the x and y positions of the image:*/
a = mainImg.getBoundingClientRect();
/*calculate the cursor's x and y coordinates, relative to the image:*/
x = e.pageX - a.left;
y = e.pageY - a.top;
/*consider any page scrolling:*/
x = x - window.pageXOffset;
y = y - window.pageYOffset;
return {x : x, y : y};
}
}

imageZoom();

function convertPrice(price){
    var priceCoppy=price;
    var str="";
    if((priceCoppy-priceCoppy%1000000)/1000000>0){
        str=(priceCoppy-priceCoppy%1000000)/1000000+",";
        //chỉ lấy phần nguyên
        priceCoppy=priceCoppy%1000000;
    }
    if((priceCoppy-priceCoppy%1000)/1000>0){
        str+=(priceCoppy-priceCoppy%1000)/1000+","
        priceCoppy=priceCoppy%1000;
    }
    else str+="000,";
    if((priceCoppy-priceCoppy%1)/1>0){
        str+=(priceCoppy-priceCoppy%1)/1;

    }
    else str+="000";
    return str+="₫";
}
function checkSelect(list){

    var enought=false;
    for(var i=0;i<list.length;i++){
        if(list[i].classList.contains("action")) enought=true;
    }
    if(enought===false) alert("Vui Lòng Chọn Size !")
    return enought
}
function select(element){


    for (var i=0;i<listSelect;i++){
        listSelect[i].classList.remove("action");
    }
    element.querySelector(".select-image").classList.add("action")

}
function activeForm(){
    if(checkSelect(listSelect)) {
        let form = document.querySelector(".form")

        if (form.classList.contains("action-flex")) {
            form.firstElementChild.style.animation = "modalFadeOut ease 0.4s"
            setTimeout(function () {
                form.classList.remove("action-flex")
            }, 400)

        }

else{
form.firstElementChild.style.animation="modalFadeIn  ease-in 0.4s"
form.classList.add("action-flex")
}
    }
}


