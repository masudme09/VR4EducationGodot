import SpeechRecognition from "./speech_recognition"

const hooks = () => {
  let Hooks = {}
  Hooks.VoiceTyping = {
    mounted() {
      this.component = SpeechRecognition(this.el);
    },
    updated() {
      this.component.update();
    },
    destroyed() {
      this.component.destroy();
    }
  }

  return Hooks;
}

export {
  hooks
};