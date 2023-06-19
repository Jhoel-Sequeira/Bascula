let dragSource = null;

function dragStart(event) {
  dragSource = event.target;
  event.dataTransfer.setData("text/plain", event.target.innerHTML);
}

function allowDrop(event) {
  event.preventDefault();
}

function drop(event) {
  event.preventDefault();
  const dragTarget = event.target;

  if (dragTarget.id === "dropArea") {
    const newHeader = document.createElement("th");
    newHeader.innerHTML = dragSource.innerHTML;

    const tableHeader = document.querySelector("#table thead tr");
    tableHeader.appendChild(newHeader);

    const tableRows = document.querySelectorAll("#table tbody tr");
    tableRows.forEach((row) => {
      const newCell = document.createElement("td");
      newCell.innerHTML = "Celda";

      row.appendChild(newCell);
      alert("new collumn added")
    });
  }

  dragSource = null;
}
