const dateContainer = document.querySelector(".js-date"), dateTitle = dateContainer.querySelector("h4");

function getDate() {
    const d = new Date();
    const day = d.getDate();
    const month = d.getMonth()
    const year = d.getFullYear();
    const monthNames = ["JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"];

    dateTitle.innerText = `${day < 10 ? `0${day}` : day}.${monthNames[month]}.${year}`
}

getDate()