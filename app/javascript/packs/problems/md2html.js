var titles = document.getElementsByClassName("my-title");

window.onload = (e) => {
  showdown.setOption('underline', true);
  var converter = new showdown.Converter();
  for (elm of titles) {
    var text = elm.textContent;
    elm.textContent = "";
    elm.insertAdjacentHTML("afterbegin", converter.makeHtml(text));
  }
};
