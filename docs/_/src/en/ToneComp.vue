<script setup lang="ts">
import * as Tone from 'tone'

const data = {
  a: ['A2#', 'A3#', 'C#4', 'D4#']
}
// const synth = new Tone.FMSynth().toDestination();
// const now = Tone.now()

// const loop = new Tone.Loop(v => {
//   synth.triggerAttackRelease(data.a[0], v)
// }).start(0)

// const start = async () => {
//   await Tone.Transport.start()
//   await Tone.Transport.bpm.rampTo(112, 1)
// }

const synth = new Tone.PolySynth().toDestination()
const start = async () => {
  if (Tone.context.state !== 'running') Tone.Transport.start().bpm.rampTo(112, 5)
  const now = Tone.now()

  synth.triggerAttackRelease(['E#2', 'C#4', 'G#4'], '8n', now)
  synth.triggerAttackRelease(['E#2', 'C#4', 'G#4'], '8n', now + .3)
  synth.triggerAttackRelease(['E#2', 'C#4', 'G#4'], '8n', now + .6)
  synth.triggerAttackRelease(['E#2'], '8n', now + .9)
  synth.triggerAttackRelease(['C#4', 'F#4'], '4n', now + .9)
  synth.triggerAttackRelease(['E#2'], '8n', now + 1.2)
  synth.triggerAttackRelease(['E#2', 'C#4', 'F#4'], '8n', now + 1.5)
  synth.triggerAttackRelease(['E#2', 'C#4', 'F#4'], '8n', now + 1.8)
  synth.triggerAttackRelease(['E#2'], '8n', now + 2.1)
  synth.triggerAttackRelease(['C#4', 'F4'], '4n', now + 2.1)
  synth.triggerAttackRelease(['E#2'], '8n', now + 2.4)
  synth.triggerAttackRelease(['E#2', 'C#4', 'F4'], '8n', now + 2.7)
  synth.triggerAttackRelease(['E#2', 'C#4', 'F4'], '8n', now + 3.0)
  synth.triggerAttackRelease(['E#2'], '8n', now + 3.3)
  synth.triggerAttackRelease(['C#4', 'F#4'], '4n', now + 3.3)
  synth.triggerAttackRelease(['E#2'], '8n', now + 3.6)
  synth.triggerAttackRelease(['E#2'], '8n', now + 3.9)
  synth.triggerAttackRelease(['E#2', 'C#4', 'F#4'], '4n', now + 4.2)
  synth.triggerAttackRelease(['E#2'], '8n', now + 4.5)

  synth.triggerAttackRelease(['D#2', 'A#3', 'D#4'], '8n', now + 4.8)
  synth.triggerAttackRelease(['D#2', 'A#3', 'D#4'], '8n', now + 5.1)
  synth.triggerAttackRelease(['D#2', 'A#3', 'D#4'], '8n', now + 5.4)
  synth.triggerAttackRelease(['D#2'], '8n', now + 5.7)
  synth.triggerAttackRelease(['A#3', 'C#4'], '4n', now + 5.7)
  synth.triggerAttackRelease(['D#2'], '8n', now + 6.0)
  synth.triggerAttackRelease(['D#2', 'A#3', 'C#4'], '8n', now + 6.3)
  synth.triggerAttackRelease(['D#2', 'A#3', 'C#4'], '8n', now + 6.6)
  synth.triggerAttackRelease(['D#2'], '8n', now + 6.9)
  synth.triggerAttackRelease(['A#3', 'C4'], '4n', now + 6.9)
  synth.triggerAttackRelease(['D#2'], '8n', now + 7.2)
  synth.triggerAttackRelease(['D#2', 'A#3', 'C4'], '8n', now + 7.5)
  synth.triggerAttackRelease(['D#2', 'A#3', 'C4'], '8n', now + 7.8)
  synth.triggerAttackRelease(['D#2'], '8n', now + 8.1)
  synth.triggerAttackRelease(['A#3', 'C#4'], '4n', now + 8.1)
  synth.triggerAttackRelease(['D#2'], '8n', now + 8.4)
  synth.triggerAttackRelease(['D#2'], '8n', now + 8.7)
  synth.triggerAttackRelease(['D#2', 'A#3', 'C#4'], '4n', now + 9.0)
  synth.triggerAttackRelease(['D#2'], '8n', now + 9.3)

  synth.triggerAttackRelease(['A#2', 'A#3', 'D#4'], '8n', now + 9.6)
  synth.triggerAttackRelease(['A#2', 'A#3', 'D#4'], '8n', now + 9.9)
  synth.triggerAttackRelease(['A#2', 'A#3', 'D#4'], '8n', now + 10.2)
  synth.triggerAttackRelease(['A#2'], '8n', now + 10.5)
  synth.triggerAttackRelease(['A#3', 'C#4'], '4n', now + 10.5)
  synth.triggerAttackRelease(['A#2'], '8n', now + 10.8)
  synth.triggerAttackRelease(['A#2', 'A#3', 'C#4'], '8n', now + 11.1)
  synth.triggerAttackRelease(['A#2', 'A#3', 'C#4'], '8n', now + 11.4)
  synth.triggerAttackRelease(['A#2'], '8n', now + 11.7)
  synth.triggerAttackRelease(['A#3', 'C4'], '4n', now + 11.7)
  synth.triggerAttackRelease(['A#2'], '8n', now + 12.0)
  synth.triggerAttackRelease(['A#2', 'A#3', 'C4'], '8n', now + 12.3)
  synth.triggerAttackRelease(['A#2', 'A#3', 'C4'], '8n', now + 12.6)
  synth.triggerAttackRelease(['A#2'], '8n', now + 12.9)
  synth.triggerAttackRelease(['A#3', 'C#4'], '4n', now + 12.9)
  synth.triggerAttackRelease(['A#2'], '8n', now + 13.2)
  synth.triggerAttackRelease(['A#2'], '8n', now + 13.5)
  synth.triggerAttackRelease(['A#2', 'A#3', 'C#4'], '4n', now + 13.8)
  synth.triggerAttackRelease(['A#2'], '8n', now + 14.1)

  synth.triggerAttackRelease(['G#2', 'G#3', 'D#4'], '8n', now + 14.4)
  synth.triggerAttackRelease(['G#2', 'G#3', 'D#4'], '8n', now + 14.7)
  synth.triggerAttackRelease(['G#2', 'G#3', 'D#4'], '8n', now + 15.0)
  synth.triggerAttackRelease(['G#2'], '8n', now + 15.3)
  synth.triggerAttackRelease(['G#3', 'C#4'], '4n', now + 15.3)
  synth.triggerAttackRelease(['G#2'], '8n', now + 15.6)
  synth.triggerAttackRelease(['G#2', 'G#3', 'C#4'], '8n', now + 15.9)
  synth.triggerAttackRelease(['G#2', 'G#3', 'C#4'], '8n', now + 16.2)
  synth.triggerAttackRelease(['G#2'], '8n', now + 16.5)
  synth.triggerAttackRelease(['G#3', 'C4'], '4n', now + 16.5)
  synth.triggerAttackRelease(['G#2'], '8n', now + 16.8)
  synth.triggerAttackRelease(['G#2', 'G#3', 'C4'], '8n', now + 17.1)
  synth.triggerAttackRelease(['G#2', 'G#3', 'C4'], '8n', now + 17.4)
  synth.triggerAttackRelease(['G#2'], '8n', now + 17.7)
  synth.triggerAttackRelease(['G#3', 'C#4'], '4n', now + 17.7)
  synth.triggerAttackRelease(['G#2'], '8n', now + 18.0)
  synth.triggerAttackRelease(['G#2'], '8n', now + 18.3)
  synth.triggerAttackRelease(['G#2', 'G#3', 'C#4'], '4n', now + 18.6)
  synth.triggerAttackRelease(['G#2'], '8n', now + 18.9)
}
const stop = () => { }
const pause = () => { }
</script>
<template>
  <button @click="start">start</button>
  <button @click="stop">stop</button>
  <button @click="pause">pause</button>
</template>