import { Controller } from "@hotwired/stimulus"
import { Howl, Howler } from "howler"

// Connects to data-controller="audio-player"
export default class extends Controller {
  static values = { sample: String }
  static targets = [ "button" ]
  sound;

  connect() {
    this.sound = new Howl({
      src: [this.sampleValue],
      onplay: () => {
        const button = this.buttonTarget
        button.setAttribute("data-action", "click->audio-player#stop")
        button.innerHTML = `<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                              <path stroke-linecap="round" stroke-linejoin="round" d="M5.25 7.5A2.25 2.25 0 017.5 5.25h9a2.25 2.25 0 012.25 2.25v9a2.25 2.25 0 01-2.25 2.25h-9a2.25 2.25 0 01-2.25-2.25v-9z" />
                            </svg>`
        let analyser = Howler.ctx.createAnalyser()
        console.log(analyser)
      },
      onstop: () => {
        const button = this.buttonTarget
        button.setAttribute("data-action", "click->audio-player#play")
        button.innerHTML = `<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                              <path stroke-linecap="round" stroke-linejoin="round" d="M5.25 5.653c0-.856.917-1.398 1.667-.986l11.54 6.348a1.125 1.125 0 010 1.971l-11.54 6.347a1.125 1.125 0 01-1.667-.985V5.653z" />
                            </svg>`
      },
      onend: () => {
        this.sound.stop()
      }
    })
  }

  play() {
    this.sound.play();
  }

  stop() {
    this.sound.stop();
  }
}
