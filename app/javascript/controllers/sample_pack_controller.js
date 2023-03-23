import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="sample-pack"
export default class extends Controller {
  connect() {
    const radialProgressBar = document.getElementById("radial-progress")
    const intervalID = setInterval(() => {
      fetch("/status", {
        method: "GET"
      })
        .then((response) => {
          if (response.status === 200) {
            return response.json()
          } else {
            cleanInterval(intervalID)
          }
        })
        .then((data) => {
          console.log(data.progress, 'data')
          if (data.progress) {
            radialProgressBar.classList.remove("hidden")
            radialProgressBar.classList.add("fixed")
            // radialProgressBar.style.cssText = `--value:${data.progress.at}; --thickness: 2px;`
            radialProgressBar.textContent = `${data.progress.at}% — ${data.progress.message}`
          }

          if (data.progress.at === "100") {
            clearInterval(intervalID)
          }
        })
        .catch((e) => {
          console.error(e, 'error')
          clearInterval(intervalID)
        })
    }, 1000)
  }
}
