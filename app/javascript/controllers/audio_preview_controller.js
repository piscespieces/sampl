import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="audio-preview"
export default class extends Controller {
  tags = null;

  connect() {
    fetch("/sample_tags", {
      method: "GET",
      headers: {
        "Content-Type": "application/json"
      }
    })
    .then(response => response.json())
    .then(data => {
      this.tags = data;
    })
    .catch(error => console.error(error))
  }

  getFileName(event) {
    const audioFilesContainer = document.getElementById("audio-files-container")
    const files = event.target.files;
    
    for (let file of files) {
      const audioContainer = document.createElement("div")
      audioContainer.classList.add("mb-4")

      const labelsContainer = document.createElement("div")
      labelsContainer.classList.add("flex", "gap-3")

      const audioPlayer = document.createElement("audio");
      const audioSource = document.createElement("source");
      const songName = document.createElement("p");
      songName.classList.add("prose", "mt-2")
      
      for (let tag of this.tags) {
        const label = document.createElement("label")
        label.classList.add("prose", "prose-sm", "prose-gray")
        label.textContent = tag;
        const checkbox = document.createElement("input")
        checkbox.setAttribute("type", "checkbox")
        checkbox.setAttribute("name", `sample_tags[${file.name}][${tag}]`)
        checkbox.classList.add("checkbox", "checkbox-xs")
        const labelCheckboxContainer = document.createElement("div")
        labelCheckboxContainer.classList.add("flex", "gap-1", "items-center")
        labelCheckboxContainer.append(label)
        labelCheckboxContainer.append(checkbox)
        labelsContainer.append(labelCheckboxContainer)
      }
      
      songName.textContent = file.name
      const src = URL.createObjectURL(file);
      audioPlayer.setAttribute("controls", "controls")
      audioPlayer.append(audioSource);
      audioSource.setAttribute("src", src);

      audioContainer.append(labelsContainer)
      audioContainer.append(audioPlayer)
      audioContainer.append(songName);

      audioFilesContainer.append(audioContainer);
    }
  }

  setCheckboxes(container, fileName, labels) {
    for (const c of checkboxLabels) {
      const checkbox = document.createElement("input")
      checkbox.setAttribute("type", "checkbox")
      checkbox.setAttribute("name", `sample_tags[${fileName}]`)
      container.append(checkbox)
    }
    // checkboxCollection.setAttribute("type", "checkbox")
  }
}
