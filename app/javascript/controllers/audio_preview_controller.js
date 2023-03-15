import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="audio-preview"
export default class extends Controller {
  connect() {

  }

  getFileName(event) {
    const tags = ["fx", "drums", "synths"]
    const audioFilesContainer = document.getElementById("audio-files-container");
    const files = event.target.files;
    
    for (let file of files) {
      const audioPlayer = document.createElement("audio");
      const audioSource = document.createElement("source");
      const songName = document.createElement("p");
      
      // for (let tag of tags) {
      //   const label = document.createElement("label")
      //   label.textContent = tag;
      //   const checkbox = document.createElement("input")
      //   checkbox.setAttribute("type", "checkbox")
      //   checkbox.setAttribute("name", `sample_tags[${file.name}][${tag}]`)
      //   audioFilesContainer.append(label)
      //   audioFilesContainer.append(checkbox)
      // }
      
      songName.textContent = file.name
      const src = URL.createObjectURL(file);
      audioPlayer.setAttribute("controls", "controls")
      audioPlayer.append(audioSource);
      audioSource.setAttribute("src", src);
      audioFilesContainer.append(audioPlayer);
      audioFilesContainer.append(songName);
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
