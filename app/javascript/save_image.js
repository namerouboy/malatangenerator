document.addEventListener("DOMContentLoaded", () => {
  const saveButton = document.querySelector(".save-image-btn");
  const target = document.getElementById("result-capture");

  if (saveButton && target) {
    saveButton.addEventListener("click", () => {
      html2canvas(target).then(canvas => {
        const link = document.createElement("a");
        link.download = "malatan_result.png";
        link.href = canvas.toDataURL("image/png");
        link.click();
      });
    });
  }
});