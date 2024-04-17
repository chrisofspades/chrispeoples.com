function localizeTimeElements(e) {
    let times = document.querySelectorAll("time[data-localize]");
    times.forEach(time => {
        let date = new Date(time.getAttribute("datetime") || time.innerText);
        time.innerText = date.toLocaleString("en-CA", { dateStyle: "short", timeStyle: "short"});
    })
}

addEventListener("DOMContentLoaded", localizeTimeElements);