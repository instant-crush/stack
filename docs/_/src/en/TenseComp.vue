<script setup lang="ts">
import { nanoid } from 'nanoid'
import { computed, ref, watch } from 'vue'

const isEgs = ref(false)
const isNegative = ref(false)
const isInterrogative = ref(false)
const heads = ref([
  'times/states',
  'past',
  'present',
  'future',
  'future in past',
])
const data = ref({
  simple: [
    {
      positive: [
        { rule: 'S + was/were + N', egs: ['I was a developer.' ] },
        { rule: 'S + V2', egs: ['I developed apps.' ] },
      ],
      negative: [
        { rule: 'S + was/were not + N', egs: ['I was not a developer.' ] },
        { rule: 'S + did not + V1', egs: ['I did not develop apps.' ] },
      ],
      interrogative: [
        { rule: 'Was/Were + S + N + ?', egs: ['Were you a developer?' ] },
        { rule: 'Did + S + V1 + ?', egs: ['Did you develop apps?' ] },
      ],
    },
    {
      positive: [
        { rule: 'S + am/is/are + N', egs: ['I am a developer.' ] },
        { rule: 'S + V1', egs: ['I develop apps.' ] },
      ],
      negative: [
        { rule: 'S + am/is/are not + N', egs: ['I am not a developer.' ] },
        { rule: 'S + do/does not + V1', egs: ['I do not develop apps.' ] },
      ],
      interrogative: [
        { rule: 'Am/Is/Are + S + N + ?', egs: ['Am I a developer?' ] },
        { rule: 'Do/Does + S + V1 + ?', egs: ['Do I develop apps?' ] },
      ],
    },
    {
      positive: [
        { rule: 'S + will + be + N', egs: ['I will be a developer.' ] },
        { rule: 'S + will + V1', egs: ['I will develop apps.' ] },
      ],
      negative: [
        { rule: 'S + will not + be + N', egs: ['I will not be a developer.' ] },
        { rule: 'S + will not + V1', egs: ['I will not develop apps.' ] },
      ],
      interrogative: [
        { rule: 'Will + S + be + N + ?', egs: ['Will I be a developer?' ] },
        { rule: 'Will + S + V1 + ?', egs: ['Will I develop apps?' ] },
      ],
    },
    {
      positive: [
        { rule: 'S + would + be + N', egs: ['I thought he would be a developer.' ] },
        { rule: 'S + would + V1', egs: ['I thought he would develop apps.' ] },
      ],
      negative: [
        {
          rule: 'S + would not + be + N',
          egs: ['I thought he would not be a developer.'],
        },
        {
          rule: 'S + would not + V1',
          egs: ['I thought he would not develop apps.'],
        },
      ],
      interrogative: [
        { rule: 'Would + S + be + N + ?', egs: ['Would he be a developer?' ] },
        { rule: 'Would + S + V1 + ?', egs: ['Would he develop apps?' ] },
      ],
    },
  ],
  perfect: [
    {
      positive: [
        { rule: 'S + had been + N', egs: ['I had been a developer.' ] },
        { rule: 'S + had + V3', egs: ['I had developed apps.' ] },
      ],
      negative: [
        { rule: 'S + had not been + N', egs: ['I had not been a developer.' ] },
        { rule: 'S + had not + V3', egs: ['I had not developed apps.' ] },
      ],
      interrogative: [
        { rule: 'Had + S + been + N +?', egs: ['Had I been a developer?' ] },
        { rule: 'Had + S + V3 + ?', egs: ['Had I developed apps?' ] },
      ],
    },
    {
      positive: [
        { rule: 'S + have/has been + N', egs: ['I have been a developer.' ] },
        { rule: 'S + have/has + V3', egs: ['I have developed apps.' ] },
      ],
      negative: [
        { rule: 'S + have/has not been + N', egs: ['I have not been a developer.' ] },
        { rule: 'S + have/has not + V3', egs: ['I have not developed apps.' ] },
      ],
      interrogative: [
        { rule: 'Have/Has + S + been + N + ?', egs: ['Have I been a developer?' ] },
        { rule: 'Have/Has + S + V3 + ?', egs: ['Have I developed apps?' ] },
      ],
    },
    {
      positive: [
        { rule: 'S + will have been + N', egs: ['I will have been a developer.' ] },
        { rule: 'S + will have + V3', egs: ['I will have developed apps.' ] },
      ],
      negative: [
        {
          rule: 'S + will not have been + N',
          egs: ['I will not have been a developer.'],
        },
        {
          rule: 'S + will not have + V3',
          egs: ['I will not have developed apps.'],
        },
      ],
      interrogative: [
        { rule: 'Will + S + have been + N + ?', egs: ['Will I have been a developer?' ] },
        { rule: 'Will + S + have + V3 + ?', egs: ['Will I have developed apps?' ] },
      ],
    },
    {
      positive: [
        {
          rule: 'S + would have been + N',
          egs: ['I thought he would have been a developer.'],
        },
        {
          rule: 'S + would have + V3',
          egs: ['I thought he would have developed apps.'],
        },
      ],
      negative: [
        {
          rule: 'S + would not have been + N',
          egs: ['I thought he would not have been a developer.'],
        },
        {
          rule: 'S + would not have + V3',
          egs: ['I thought he would not have developed apps.'],
        },
      ],
      interrogative: [
        {
          rule: 'Would + S + have been + N +?',
          egs: ['Would he have been a developer?'],
        },
        { rule: 'Would + S + have + V3 + ?', egs: ['Would he have developed apps?' ] },
      ],
    },
  ],
  continuous: [
    {
      positive: [
        { rule: 'S + was/were + being + N', egs: ['I was being a developer.' ] },
        { rule: 'S + was/were + Ving', egs: ['I was developing apps.' ] },
      ],
      negative: [
        {
          rule: 'S + was/were not + being + N',
          egs: ['I was not being a developer.'],
        },
        { rule: 'S + was/were not + Ving', egs: ['I was not developing apps.' ] },
      ],
      interrogative: [
        {
          rule: 'Was/Were + S + being + N + ?',
          egs: ['Were you being a developer?'],
        },
        { rule: 'Was/Were + S + Ving + ?', egs: ['Were you developing apps?' ] },
      ],
    },
    {
      positive: [
        { rule: 'S + am/is/are + being + N', egs: ['I am being a developer.' ] },
        { rule: 'S + am/is/are + Ving', egs: ['I am developing apps.' ] },
      ],
      negative: [
        {
          rule: 'S + am/is/are not + being + N',
          egs: ['I am not being a developer.'],
        },
        { rule: 'S + am/is/are not + Ving', egs: ['I am not developing apps.' ] },
      ],
      interrogative: [
        {
          rule: 'Am/Is/Are + S + being + N + ?',
          egs: ['Am I being a developer?'],
        },
        { rule: 'Am/Is/Are + S + Ving + ?', egs: ['Am I developing apps?' ] },
      ],
    },
    {
      positive: [
        {
          rule: 'S + will be + N/Ving',
          egs: ['I will be a developer.', 'I will be developing apps.'],
        },
      ],
      negative: [
        {
          rule: 'S + will not be + N/Ving',
          egs: ['I will not be a developer.', 'I will not be developing apps.'],
        },
      ],
      interrogative: [
        {
          rule: 'Will + S + be + N/Ving + ?',
          egs: ['Will I be a developer?', 'Will I be developing apps?'],
        },
      ],
    },
    {
      positive: [
        {
          rule: 'S + would be + N/Ving',
          egs: ['I thought he would be a developer.', 'I thought he would be developing apps.'],
        },
      ],
      negative: [
        {
          rule: 'S + would not be + N/Ving',
          egs: ['I thought he would not be being a developer.', 'I thought he would not be developing apps.'],
        },
      ],
      interrogative: [
        {
          rule: 'Would + S + be + N/Ving + ?',
          egs: ['Would he be a developer?', 'Would he be developing apps?'],
        },
      ],
    },
  ],
  'perfect continuous': [
    {
      positive: [
        {
          rule: 'S + had been + being + N',
          egs: ['I had been being a developer.'],
        },
        { rule: 'S + had been + Ving', egs: ['I had been developing apps.' ] },
      ],
      negative: [
        {
          rule: 'S + had not been + being + N',
          egs: ['I had not been being a developer.'],
        },
        {
          rule: 'S + had not been + Ving',
          egs: ['I had not been developing apps.'],
        },
      ],
      interrogative: [
        {
          rule: 'Had + S + been + being + N + ?',
          egs: ['Had I been being a developer?'],
        },
        { rule: 'Had + S + been + Ving + ?', egs: ['Had I been developing apps?' ] },
      ],
    },
    {
      positive: [
        {
          rule: 'S + have/has been + being + N',
          egs: ['I have been being a developer.'],
        },
        {
          rule: 'S + have/has been + Ving',
          egs: ['I have been developing apps.'],
        },
      ],
      negative: [
        {
          rule: 'S + have/has not been + being + N',
          egs: ['I have not been being a developer.'],
        },
        {
          rule: 'S + have/has not been + Ving',
          egs: ['I have not been developing apps.'],
        },
      ],
      interrogative: [
        {
          rule: 'Have/Has + S + been + being + N + ?',
          egs: ['Have I been being a developer?'],
        },
        {
          rule: 'Have/Has + S + been + Ving + ?',
          egs: ['Have I been developing apps?'],
        },
      ],
    },
    {
      positive: [
        {
          rule: 'S + will have been + N/Ving',
          egs: ['I will have been a developer.', 'I will have been developing apps.'],
        },
      ],
      negative: [
        {
          rule: 'S + will not have been + N/Ving',
          egs: ['I will not have been a developer.', 'I will not have been developing apps.'],
        },
      ],
      interrogative: [
        {
          rule: 'Will + S + have been + N/Ving + ?',
          egs: ['Will I have been being a developer?', 'Will I have been developing apps?'],
        },
      ],
    },
    {
      positive: [
        {
          rule: 'S + would have been + N/Ving',
          egs: ['I thought he would have been a developer.', 'I thought he would have been developing apps.'],
        },
      ],
      negative: [
        {
          rule: 'S + would not have been + N/Ving',
          egs: ['I thought he would not have been being a developer.', 'I thought he would not have been developing apps.'],
        },
      ],
      interrogative: [
        {
          rule: 'Would + S + have been + N/Ving + ?',
          egs: ['Would he have been being a developer?', 'Would he have been developing apps?'],
        },
      ],
    },
  ],
})
const colors = ref<{ r: number; g: number; b: number; a: number }[]>([
  { r: 255, g: 255, b: 255, a: 1 },
  { r: 255, g: 0, b: 0, a: 1 },
  { r: 0, g: 255, b: 0, a: 1 },
  { r: 0, g: 0, b: 255, a: 1 },
  { r: 255, g: 255, b: 0, a: 1 },
  { r: 0, g: 255, b: 255, a: 1 },
  { r: 255, g: 0, b: 255, a: 1 },
  { r: 0, g: 0, b: 0, a: 1 },
])
const colorsSelected = ref<{ r: number; g: number; b: number; a: number }[]>([])
const colorsAdd = () =>
  colors.value.push({
    r: Math.floor(Math.random() * 256),
    g: Math.floor(Math.random() * 256),
    b: Math.floor(Math.random() * 256),
    a: +Math.random().toFixed(2),
  })
const proportions = ref<number[]>([])
watch(colorsSelected, (v) => {
  proportions.value.length = v.length
  proportions.value.fill(1 / v.length)
})
const colorGen = computed(() => {
  const colorNew = {
    r: 0,
    g: 0,
    b: 0,
    a: 0,
  }
  for (let i = 0; i < colorsSelected.value.length; i++) {
    colorNew.r += colorsSelected.value[i].r * proportions.value[i]
    colorNew.g += colorsSelected.value[i].g * proportions.value[i]
    colorNew.b += colorsSelected.value[i].b * proportions.value[i]
    colorNew.a += colorsSelected.value[i].a * proportions.value[i]
  }
  return `rgba(${colorNew.r.toFixed(0)}, ${colorNew.g.toFixed(
    0,
  )}, ${colorNew.b.toFixed(0)}, ${colorNew.a})`
})
const proportionChange = (v: number, index: number) => {
  proportions.value.forEach((_, k, a) => {
    if (index !== k) {
      a[k] = (1 - v) / (a.length - 1)
    }
  })
}
</script>
<template>
  <!-- <details open>
    <summary>operations & result</summary>
    <button @click="colorsAdd">colors add</button>
    <div>
      <div class="h-8 w-20 rounded" :style="{ backgroundColor: colorGen }" />
      <span>{{ colorGen }}</span>
    </div>
  </details>
  <details open>
    <summary>colors selected</summary>
    <div class="flex flex-col">
      <div class="flex items-center" v-for="(v, k) of colorsSelected" :key="nanoid()">
        <div
          class="mx-2 h-4 w-8 rounded"
          :style="{ backgroundColor: `rgba(${v.r}, ${v.g}, ${v.b}, ${v.a})` }"
        />
        <span>{{ `rgba(${v.r},${v.g},${v.b},${v.a})` }}</span>
        <label
          ><input
            min="0"
            max="1"
            type="range"
            step="0.005"
            v-model="proportions[k]"
            @input="
              proportionChange(+($event.target as HTMLInputElement).value, k)
            "
          />{{ proportions[k] }}</label
        >
      </div>
    </div>
  </details>
  <details open>
    <summary>colors</summary>
    <div class="flex flex-wrap font-mono">
      <label class="flex items-center" v-for="v of colors" :key="nanoid()">
        <input type="checkbox" :value="v" v-model="colorsSelected" />
        <div
          class="mx-2 h-4 w-8 rounded"
          :style="{ backgroundColor: `rgba(${v.r}, ${v.g}, ${v.b}, ${v.a})` }"
        />
        <span>{{ `rgba(${v.r},${v.g},${v.b},${v.a})` }}</span>
      </label>
    </div>
  </details> -->
  <div class="flex flex-col items-start mt-5">
    <button @click="isEgs = !isEgs" :class="['mb-1 border border-solid px-2 rounded-md', isEgs ? 'text-green-500' : '']">egs</button>
    <button @click="isNegative = !isNegative" :class="['mb-1 border border-solid px-2 rounded-md', isNegative ? 'text-green-500' : '']">negatives</button>
    <button @click="isInterrogative = !isInterrogative" :class="['border border-solid px-2 rounded-md', isInterrogative ? 'text-green-500' : '']">interrogatives</button>
  </div>
  <table class="whitespace-nowrap">
    <thead>
      <tr>
        <th v-for="head in Object.values(heads)" :key="nanoid()">{{ head }}</th>
      </tr>
    </thead>
    <tbody>
      <tr class="border" v-for="(tr, th) in data" :key="nanoid()">
        <th>
          {{ th }}
        </th>
        <td class="!p-0" v-for="tds in tr" :key="nanoid()">
          <div :class="['']" v-for="(sentenceType, sentenceTypeK, sentenceTypeI) of tds" :key="nanoid()">
            <div v-show="sentenceTypeK === 'positive' || (sentenceTypeK === 'negative' && isNegative) || (sentenceTypeK === 'interrogative' && isInterrogative)" class="flex flex-col leading-none" v-for="dynamicOrStatic of sentenceType" :key="nanoid()">
              <div class="flex flex-nowrap">
                <div class="mr-2 flex flex-nowrap" v-for="(item, itemK) of dynamicOrStatic.rule.split(' + ')" :key="nanoid()">
                  <div class="font-mono">
                    <i v-if="itemK !== 0" class="text-xs text-slate-600 dark:text-slate-300">+</i>
                    <span v-if="item === 'N/Ving'">
                      <i>N/</i>
                      <i class="verb-form-4">Ving</i>
                    </span>
                    <span v-else :class="[
                      item === 'V1' ? 'verb-form-1' : '',
                      item === 'V2' ? 'verb-form-2' : '',
                      item === 'V3' ? 'verb-form-3' : '',
                      item === 'Ving' ? 'verb-form-4' : ''
                    ]">{{ item }}</span>
                  </div>
                </div>
              </div>
              <div v-show="isEgs" class="flex flex-col text-xs text-slate-500 dark:text-slate-400" v-for="eg of dynamicOrStatic.egs" :key="nanoid()">
                <span>{{ eg }}</span>
              </div>
            </div>
          </div>
        </td>
      </tr>
    </tbody>
  </table>
</template>
<style scoped>
.auxiliary {
  @apply underline decoration-double;
}

.verb-form-1 {
  @apply text-sky-400 dark:text-sky-500;
}

.verb-form-2 {
  @apply text-amber-400 dark:text-amber-500;
}

.verb-form-3 {
  @apply text-rose-400 dark:text-rose-500;
}

.verb-form-4 {
  @apply text-emerald-400 dark:text-emerald-500;
}

.verb-form-5 {
  @apply text-violet-400 dark:text-violet-500;
}
</style>