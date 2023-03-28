import { Controller } from "@hotwired/stimulus"
import { Howl, Howler } from "howler"

// Connects to data-controller="audio-player"
export default class extends Controller {
  static values = { sample: String }
  sound;

  connect() {
    this.sound = new Howl({
      src: [this.sampleValue]
    })
  }

  play() {
    this.sound.play();
  }

  pause() {
    this.sound.stop();
  }
}
