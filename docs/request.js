'use strict'
onmessage = function(m){
  const v = JSON.parse(m.data),
    f = new XMLHttpRequest()
  f.onreadystatechange = function () {
    if (4 === f.readyState) {
      v.response = f.responseText
      postMessage(JSON.stringify(v))
    }
  }
  f.open('GET', v.url, true)
  f.send()
}

