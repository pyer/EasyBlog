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

// Lang selector

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

// Upload files

const url = "https://www.bazonnard.fr/upload/";

let interval = null;
let progress = 0;
let inProgress = false;
const step = 5;

const progressBar = document.getElementById("progressBar");

function animateLoading() {
  progress += step;
  if (progress>100) {
    progress = 0;
  }
  progressBar.style.width = "" + progress + "%";
}

function startLoading(fileName) {
  console.log("startLoading");
  document.getElementById("uploadText").innerText = "Uploading " + fileName;
  progressBar.textContent = "";
  progressBar.style.backgroundColor = "#b8ddb8";
  interval = setInterval(animateLoading, 100);
  inProgress = true;
}

function stopLoading(msg, color) {
  console.log("stopLoading");
  clearInterval(interval);
  inProgress = false;
  progressBar.style.width = "100%";
  progressBar.style.backgroundColor = color;
  progressBar.textContent = msg;
  document.getElementById("uploadText").innerText = "Upload";
}

const reqHandler = (r) => {
		if (r.ok) {
      stopLoading("OK", "#b8ddb8");
    } else {
      stopLoading("Error " + r.status + " : " + r.statusText, "red");
		}
		return r;
}

const reqMethod = (method, url, body, headers) => {
	return fetch(url, {method, body, headers});
}

document.getElementById("fileInput").onchange = function () {
  if (!inProgress) {
    if (this.files && this.files[0]) {
        const file = this.files[0];
        console.log("Upload " + file.name + "(" + file.size + " bytes)");
        if (file.size > 16777200) {
          // Max file size is 16 Mb
          stopLoading("Error : the file " + file.name + " is too large.", "red");
        } else {
          startLoading(file.name);
		      return reqMethod("PUT", url + file.name, file, {}).then(reqHandler);
        }
    }
  }
}

document.getElementById("uploadButton").onclick = function() {
  if (!inProgress) {
    document.getElementById("fileInput").click();
  }
}

//fixed header

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

