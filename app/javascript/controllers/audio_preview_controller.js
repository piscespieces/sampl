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
      await this.uploadAudio(files[i], i)
    }
  }

  async uploadAudio(file, index) {
    const progressBar = document.createElement("progress")
    const progressLabel = document.createElement("label")
    progressLabel.classList.add("block", "mb-1", "prose", "prose-sm", "prose-gray")
    progressLabel.textContent = `Uploading ${file.name}...`
    progressBar.classList.add("progress", "progress-info", "w-56", "mb-4", "block")
    this.audioFilesContainer.append(progressLabel)
    this.audioFilesContainer.append(progressBar)
    

    setTimeout(() => {
      const upload = new DirectUpload(file, "/rails/active_storage/direct_uploads")
      upload.create((error, blob) => {
        if (error) {
          console.error(error, "error")
          progressLabel.remove()
          progressBar.remove()
        } else {
          let signedId = blob.signed_id;
          let url = `/rails/active_storage/blobs/${signedId}/${file.name}`;

          const sampleFieldsContainer = document.createElement("div")
  
          const nameLabel = document.createElement("label")
          nameLabel.classList.add("label", "prose", "prose-sm", "prose-gray")
          nameLabel.textContent = "Sample Name"
          sampleFieldsContainer.append(nameLabel)

          const nameField = document.createElement("input")
          nameField.setAttribute("type", "text")
          nameField.setAttribute("name", `sample_pack[samples_attributes][${index + (this.audioFilesCount || 1)}][name]`)
          nameField.setAttribute("value", file.name)
          nameField.classList.add("mb-1", "input", "input-sm", "input-bordered", "w-full", "bg-neutral", "md:max-w-md")
          sampleFieldsContainer.append(nameField)

          const keyLabel = document.createElement("label")
          keyLabel.classList.add("label", "prose", "prose-sm", "prose-gray")
          keyLabel.textContent = "Key"
          sampleFieldsContainer.append(keyLabel)

          const keyField = document.createElement("input")
          keyField.setAttribute("type", "text")
          keyField.setAttribute("placeholder", "C#")
          keyField.setAttribute("name", `sample_pack[samples_attributes][${index + (this.audioFilesCount || 1)}][key]`)
          keyField.classList.add("mb-1", "input", "input-sm", "input-bordered", "w-full", "bg-neutral", "md:max-w-md")
          sampleFieldsContainer.append(keyField)

          const bpmLabel = document.createElement("label")
          bpmLabel.classList.add("label", "prose", "prose-sm", "prose-gray")
          bpmLabel.textContent = "BPM"
          sampleFieldsContainer.append(bpmLabel)

          const bpmField = document.createElement("input")
          bpmField.setAttribute("type", "number")
          bpmField.setAttribute("min", "40")
          bpmField.setAttribute("max", "240")
          bpmField.setAttribute("placeholder", "180")
          bpmField.setAttribute("name", `sample_pack[samples_attributes][${index + (this.audioFilesCount || 1)}][bpm]`)
          bpmField.classList.add("mb-1", "input", "input-sm", "input-bordered", "w-full", "bg-neutral", "md:max-w-md")
          sampleFieldsContainer.append(bpmField)
          
          const hiddenField = document.createElement("input")
          hiddenField.setAttribute("type", "hidden")
          hiddenField.setAttribute("name", `sample_pack[samples_attributes][${index + (this.audioFilesCount || 1)}][audio]`)
          hiddenField.setAttribute("value", signedId)
          sampleFieldsContainer.append(hiddenField)
  
          const audioPlayer = document.createElement("audio")
          const audioSource = document.createElement("source")
          audioPlayer.setAttribute("controls", "controls")
          audioPlayer.classList.add("my-4")
          audioPlayer.append(audioSource);
          audioSource.setAttribute("src", url);

          sampleFieldsContainer.classList.add("border-t", "border-gray-600")
          sampleFieldsContainer.append(audioPlayer)
          
          this.audioFilesContainer.append(sampleFieldsContainer)
          progressLabel.remove()
          progressBar.remove()
        }
      })
    }, 1000);
  }
}
