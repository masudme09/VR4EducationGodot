import $ from "jquery"

const SpeechRecognition = (el) => {
  let $el;
  let $title_input;
  let $content_input;
  let $btn_voice_typing;
  let speech_recognition;
  let title;
  let content;
  let recognition;
  let voice_btn_status;
  let $mic_icon;

  const attach = (el) => {
    $el = $(el);
    speech_recognition = window.SpeechRecognition || window.webkitSpeechRecognition;
    $title_input = $el.find(".title_input");
    $content_input = $el.find(".content_input");
    title = $title_input.val();
    content = $content_input.val();
    voice_btn_status = false;

    if (speech_recognition) {
      console.log("your browser support voice recognition");
      recognition = new speech_recognition();
      recognition.continuous = true;
      recognition.addEventListener("result", resultOfSpeechRecognition);

      $btn_voice_typing = $el.find(".btn.voice_typing");
      $mic_icon = $btn_voice_typing.find(".mic_icon");

      $btn_voice_typing.on("click", addVoiceTyping);
      $content_input.on("input", contentChanged);
      updateTextBoxes();
      update();

    } else {
      console.log("your borowser not support voice recognition");
    }

  }

  const update = (el) => {
    // updateTextBoxes();
  }

  const destroy = (el) => {
    $btn_voice_typing.unbind("click", addVoiceTyping);


    $el[0].voiceTypinginstance = null;

    $el = null;
    $title_input = null;
    $content_input = null;
    $btn_voice_typing = null;
    speech_recognition = null;

  }

  const contentChanged = () => {
    content = $content_input.val();
  }

  const updateTextBoxes = () => {
    $title_input.val(title);
    $content_input.val(content);
  }


  const addVoiceTyping = () => {

    if (voice_btn_status == false) {
      recognition.start();
      console.log("recognition started");

      $mic_icon.html("mic");

      $content_input.focus();
      voice_btn_status = true;

    } else {
      voice_btn_status = false;
      recognition.stop();
      $mic_icon.html("mic_off");
      console.log("recognition stopped");

    }
  }

  const resultOfSpeechRecognition = (event) => {
    const current = event.resultIndex;
    const transcript = event.results[current][0].transcript;

    content = content + transcript;
    $content_input.val(content);

  }

  attach(el);

  const instance = {
    $title_input,
    $content_input,
    $btn_voice_typing,
    attach,
    update,
    destroy,
  };

  el.voiceTypinginstance = instance;

  return el.voiceTypinginstance;

}

export default SpeechRecognition;