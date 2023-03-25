import { Controller } from "@hotwired/stimulus"
import { DirectUpload } from "@rails/activestorage"

// Connects to data-controller="audio-preview"
export default class extends Controller {
  tags = null;

  connect() {
    this.audioFilesCount = document.querySelectorAll("#audio").length;
    this.audioFilesContainer = document.getElementById("audio-files-container")
  }

  async change(event) {
    const files = event.target.files;

    for (let i = 0; i < files.length; i++) {
      await this.createThing(files[i], i)
    }
  }

  async createThing(file, index) {
    const upload = new DirectUpload(file, "/rails/active_storage/direct_uploads")
    upload.create((error, blob) => {
      if (error) {
        console.error(error, "error")
      } else {
        let signedId = blob.signed_id;
        let url = `/rails/active_storage/blobs/${signedId}/${file.name}`;

        const nameField = document.createElement("input")
        nameField.setAttribute("type", "text")
        nameField.setAttribute("name", `sample_pack[samples_attributes][${index + (this.audioFilesCount || 1)}][name]`)
        nameField.setAttribute("value", file.name)
        this.audioFilesContainer.append(nameField)

        const hiddenField = document.createElement("input")
        hiddenField.setAttribute("type", "hidden")
        hiddenField.setAttribute("name", `sample_pack[samples_attributes][${index + (this.audioFilesCount || 1)}][audio]`)
        hiddenField.setAttribute("value", signedId)
        this.audioFilesContainer.append(hiddenField)

        const audioPlayer = document.createElement("audio")
        const audioSource = document.createElement("source")
        audioPlayer.setAttribute("controls", "controls")
        audioPlayer.append(audioSource);
        audioSource.setAttribute("src", url);
        this.audioFilesContainer.append(audioPlayer)
      }
    })
  }
}
