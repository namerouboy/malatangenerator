document.addEventListener('DOMContentLoaded', function () {
  const buttons = document.querySelectorAll('.ingredient-button');

  buttons.forEach(button => {
    let count = 0;
    const max = parseInt(button.dataset.max, 10);
    const index = button.dataset.index;

    button.addEventListener('click', () => {
      count = (count + 1) % (max + 1); // 0～5まで繰り返す

      // 背景の割合を変更
      const percentage = (count / max) * 100;
      button.style.setProperty('--percentage', `${percentage}%`);
      button.style.setProperty('color', count > 0 ? '#F6B352' : 'black');
      button.querySelector('::before')?.remove(); // 既存のbefore削除（ない場合もある）

      // 疑似要素ではなくstyleに直接背景を付ける
      button.style.background = `linear-gradient(to right, #F68655 ${percentage}%, #f9f9f9 ${percentage}%)`;

      // hiddenのcheckboxとselectを同期
      const hiddenName = document.getElementById(`hidden_name_${index}`);
const select = document.getElementById(`suuryou_${index}`);

if (count > 0) {
  hiddenName.value = button.dataset.name;
  select.value = count;
} else {
  hiddenName.value = "";
  select.value = 0;
}
    });
  });
});