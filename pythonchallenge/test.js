function displaymessage() {
    alert("Hello World!")
}

function prod(a, b) {
    x = a * b
    return x
}

// 这行代码输出标题：
document.write("<h1>This is a header</h1>");
// 这行代码输出段落：
document.write("<p>This is a paragraph</p>");
document.write("<p>This is another paragraph</p>");
x = 5 + 5
y = '5' + '5'
document.write(x);
document.write(y);
// alert("文本")
// confirm("文本")
// prompt("文本","默认值")
product = prod(2, 3)

var i = 0
for (i = 0; i <= 10; i++) {
    document.write("The number is " + i)
    document.write("<br />")
}
var i = 0
for (i = 0; i <= 10; i++) {
    if (i == 3) {
        break
    }
    document.write("The number is " + i)
    document.write("<br />")
}

var x
var mycars = new Array()
mycars[0] = "Saab"
mycars[1] = "Volvo"
mycars[2] = "BMW"

for (x in mycars) {
    document.write(mycars[x] + "<br />")
}

var txt = ""

function message() {
    try {
        adddlert("Welcome guest!")
    } catch (err) {
        txt = "此页面存在一个错误。\n\n"
        txt += "错误描述: " + err.description + "\n\n"
        txt += "点击OK继续。\n\n"
        alert(txt)
    }
}

var browser = navigator.appName
var b_version = navigator.appVersion
var version = parseFloat(b_version)

document.write("Browser name: " + browser)
document.write("<br />")
document.write("Browser version: " + version)


function getCookie(c_name) {
    if (document.cookie.length > 0) {
        c_start = document.cookie.indexOf(c_name + "=")
        if (c_start != -1) {
            c_start = c_start + c_name.length + 1
            c_end = document.cookie.indexOf(";", c_start)
            if (c_end == -1) c_end = document.cookie.length
            return unescape(document.cookie.substring(c_start, c_end))
        }
    }
    return ""
}

function setCookie(c_name, value, expiredays) {
    var exdate = new Date()
    exdate.setDate(exdate.getDate() + expiredays)
    document.cookie = c_name + "=" + escape(value) +
        ((expiredays == null) ? "" : ";expires=" + exdate.toGMTString())
}

function checkCookie() {
    username = getCookie('username')
    if (username != null && username != "") {
        alert('Welcome again ' + username + '!')
    } else {
        username = prompt('Please enter your name:', "")
        if (username != null && username != "") {
            setCookie('username', username, 365)
        }
    }
}

function mouseOver() {
    document.b1.src = "2.png"
}

function mouseOut() {
    document.b1.src = "3.png"
}
var c = 0
var t

function timedCount() {
    document.getElementById('txt').value = c
    c = c + 1
    t = setTimeout("timedCount()", 1000)
}
