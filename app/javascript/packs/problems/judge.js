const alternatives = document.getElementsByClassName("my-alt");
const explanation = document.getElementById("explanation-area");
const answer_id = document.getElementById("answer").innerText;

var correct = document.createElement("span");
correct.classList.add("text-success");
correct.textContent = "正解！"
var incorrect = document.createElement("span");
incorrect.classList.add("text-danger");
incorrect.textContent = "不正解"

window.onload = (e) => {  
  var converter = new showdown.Converter({
    underline: true,
    simpleLineBreaks: true
  });

  const question = document.getElementById("question");
  const explanation = document.getElementById("explanation");
  var text = question.textContent;
  question.textContent = "";
  question.insertAdjacentHTML("afterbegin", converter.makeHtml(text.trim()));
  text = explanation.textContent;
  explanation.textContent = "";
  explanation.insertAdjacentHTML("afterbegin", converter.makeHtml(text.trim()));
};

for(const alt of alternatives){
  alt.onclick = (e) => {
    // 解説表示
    explanation.classList.remove("d-none");

    // 判定結果表示
    if(alt.id == answer_id){
      console.log("正解");
      alt.appendChild(correct);
    }
    else{
      console.log("不正解");
      alt.appendChild(incorrect);

    }
  };
}