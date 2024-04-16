function localizeTimeElements(e) {
    let times = document.querySelectorAll("time");
    times.forEach(time => {
        let date = new Date(time.getAttribute("datetime"));
        time.innerText = date.toLocaleString("en-CA", { dateStyle: "short", timeStyle: "short"});
    })
}

addEventListener("DOMContentLoaded", localizeTimeElements);