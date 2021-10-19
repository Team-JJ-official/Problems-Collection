const removeX = document.getElementsByClassName("my-remove-alt");
const altFormArea = document.getElementById("my-alt-form-area");

const removeForm = (e) => {
  if(altFormArea.childElementCount > 1){
    e.target.parentNode.remove();
    console.log(altFormArea.children);
    let i = 0;
    for (alt of altFormArea.children) {
      let radioElm = alt.getElementsByClassName("btn-check")[0];
      let labelElm = alt.getElementsByTagName("label")[0];
      console.log(radioElm);
      radioElm.setAttribute("id", `answer-${i}`);
      radioElm.setAttribute("value", i);
      labelElm.setAttribute("for", `answer-${i}`);
      i++;
    }
  }
};

const addForm = (e) => {
  console.log(e);
};

window.onload = () => {
  for (x of removeX){
    x.addEventListener("click", removeForm);
  }
};
