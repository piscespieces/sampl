import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="audio-preview"
export default class extends Controller {
  connect() {}

  getFileName(event) {
    const audioFilesContainer = document.getElementById("audio-files-container");
    const files = event.target.files;
    
    for (let file of files) {
      const audioPlayer = document.createElement("audio");
      const audioSource = document.createElement("source");
      const songName = document.createElement("p");
      songName.textContent = file.name
      const src = URL.createObjectURL(file);
      audioPlayer.setAttribute("controls", "controls")
      audioPlayer.append(audioSource);
      audioSource.setAttribute("src", src);
      audioFilesContainer.append(audioPlayer);
      audioFilesContainer.append(songName);
    }
  }
}
