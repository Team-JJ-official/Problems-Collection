const removeX = document.getElementsByClassName("my-remove-alt");
const addPlus = document.getElementById("my-add-alt");
const altFormArea = document.getElementById("my-alt-form-area");

const removeForm = (e) => {
  if(altFormArea.childElementCount > 1){
    e.target.parentNode.remove();
    let i = 0;
    for (alt of altFormArea.children) {
      let radioElm = alt.getElementsByClassName("btn-check")[0];
      let labelElm = alt.getElementsByTagName("label")[0];
      radioElm.setAttribute("id", `answer-${i}`);
      radioElm.setAttribute("value", i);
      labelElm.setAttribute("for", `answer-${i}`);
      i++;
    }
  }
};

const addForm = (e) => {
  let form = altFormArea.firstElementChild.cloneNode(true);
  let radioElm = form.getElementsByClassName("btn-check")[0];
  let labelElm = form.getElementsByTagName("label")[0];
  let i = altFormArea.childElementCount;
  radioElm.setAttribute("id", `answer-${i}`);
  radioElm.setAttribute("value", i);
  radioElm.removeAttribute("checked");
  labelElm.setAttribute("for", `answer-${i}`);
  altFormArea.appendChild(form);
};

window.onload = () => {
  for (x of removeX){
    x.addEventListener("click", removeForm);
  }
  addPlus.addEventListener("click", addForm);
};
