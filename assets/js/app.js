// Select lang
function setCookie(value) {
  let exp = new Date();
  // cookie expires in 1 year
  exp.setTime(exp.getTime() + 31536000000);
  document.cookie = "lang=" + value + ";expires="+ exp.toUTCString();
  document.getElementById("lang").value = value;
}

function show(elements) {
  for (var i = 0; i < elements.length; i++) {
    elements[i].style.display = "initial";
  }
}

function hide(elements) {
  for (var i = 0; i < elements.length; i++) {
    elements[i].style.display = "none";
  }
}

function selectEnglish() {
  console.log("selectEnglish");
  /*
  document.getElementById("en").style.display = "initial";
  document.getElementById("fr").style.display = "none";
  */
  hide(document.getElementsByClassName("fr"));
  show(document.getElementsByClassName("en"));
  setCookie("en_US");
}

function selectFrench() {
  console.log("selectFrench");
  hide(document.getElementsByClassName("en"));
  show(document.getElementsByClassName("fr"));
  setCookie("fr_FR");
}

document.getElementById("lang").onchange = function(evt) {
  const lang = evt.target.value;
  console.log(lang);
  if (lang === "en_US") {
    selectEnglish();
  } else {
    selectFrench();
  }
}

window.onload = function () {
  const lang = document.cookie;
  console.log("Cookie : %s", lang);
  if (lang === "lang=en_US") {
    selectEnglish();
  } else {
    // default lang is french
    selectFrench();
  }
}

//Header fixed
window.onscroll = function () {
  const docScrollTop = document.documentElement.scrollTop;

  if (window.innerWidth > 991) {
    if (docScrollTop > 100) {
      document.querySelector("header").classList.add("fixed");
    } else {
      document.querySelector("header").classList.remove("fixed");
    }
  }
}

//navbar links

const navbar = document.querySelector(".navbar");
a = navbar.querySelectorAll("a")

a.forEach(function (element) {
  element.addEventListener("click", function () {
    for (let i = 0; i < a.length; i++) {
      a[i].classList.remove("active")
    }
    this.classList.add("active");
    document.querySelector(".navbar").classList.toggle("show");
  })
})

//Hamburger

const hamBurger = document.querySelector(".hamburger");

hamBurger.addEventListener("click", function () {
  document.querySelector(".navbar").classList.toggle("show");
})

