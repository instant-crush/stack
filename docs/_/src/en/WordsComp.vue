<script setup lang="ts">
import { nanoid } from 'nanoid'
import { computed, ref, onMounted, watch } from 'vue'
import prefixes from './prefixes.json'
import roots from './roots.json'
import suffixes from './suffixes.json'
import words from './words.json'

[prefixes, roots, suffixes].forEach((_, k, a) => a[k].forEach((_, kk, aa) => aa[kk].id = nanoid()))

const clear = () => {
  search.value = ''
  related.value.length = 0
}
const search = ref('')
const query = (v: string) => {
  search.value = v
}

const origin = { prefixes, suffixes, roots }
const all = computed(() => related.value.length === 0 ? origin : {
  prefixes: prefixes.filter(v => related.value.includes(v['id'])),
  suffixes: suffixes.filter(v => related.value.includes(v['id'])),
  roots: roots.filter(v => related.value.includes(v['id']))
})
const dataTeleport = ref<string | null>(null)
const detailed = computed(() => Object.values(all.value).flat().filter(v => v['id'] === dataTeleport.value)[0])

const related = ref<string[]>([])
const results = computed(() =>
  (search.value.length !== 0
    ? words.filter(v => v.includes(search.value))
    : related.value.length !== 0
      ? words.filter(v =>
        all.value.prefixes.map(vv => Object.keys(vv.words)).flat().some(vvv => v.startsWith(vvv)) ||
        all.value.suffixes.map(vv => Object.keys(vv.words)).flat().some(vvv => v.endsWith(vvv)) ||
        all.value.roots.map(vv => Object.keys(vv.words)).flat().some(vvv => v.includes(vvv)))
      : []).sort((a, b) => a.localeCompare(b))
)
const copyResults = () => {
  navigator.clipboard.writeText(`Give me 10 sentences(simple and complex) each of these words: "${results.value.join(', ')}"`)
}
onMounted(() => {
  watch(search, (v) => {
    related.value = [
      ...prefixes.filter(vv => Object.keys(vv.words).some(vvv => v.startsWith(vvv))).map(vv => vv['id']),
      ...roots.filter(vv => Object.keys(vv.words).some(vvv => v.includes(vvv))).map(vv => vv['id']),
      ...suffixes.filter(vv => Object.keys(vv.words).some(vvv => v.endsWith(vvv))).map(vv => vv['id']),
    ]
  })
})
</script>
<template>
  <div class="mb-5 flex">
    <button
      class="rounded p-2 ring-2 ring-slate-200 transition-all duration-300 ease-in-out hover:ring-slate-300 hover:transition-all hover:duration-300 hover:ease-in-out dark:ring-slate-800 hover:dark:ring-slate-700"
      @click="clear">
      clear selected & related & search
    </button>
    <input
      class="ml-2 rounded p-2 ring-2 ring-slate-200 transition-all duration-300 ease-in-out hover:ring-slate-300 hover:transition-all hover:duration-300 hover:ease-in-out dark:ring-slate-800 hover:dark:ring-slate-700"
      placeholder="search" type="text" :value="search"
      @keypress.enter="query((($event.target) as HTMLInputElement).value)" />
  </div>
  <div class="flex flex-col">
    <details v-for="(v, k) of all" :key="nanoid()" :open="related.length !== 0">
      <summary class="!m-0 cursor-pointer">
        <span>{{ k }}{{ ':' }}</span>
        <div class="flex flex-col">
          <div class="flex flex-col border-b-2 border-slate-200 dark:border-slate-800">
            <i class="text-xs font-light leading-tight" v-for="vv of [['to change the meaning of the word'], ['to change the meaning of a word',
              'to change the part of speech of a word',
              'to change the grammatical function of a word'], []][k]" :key="nanoid()">{{ vv }}</i>
          </div>
          <span class="text-xs"><i class="">classifications/items: </i><i class="font-bold">{{ v.length }}/{{ v.map(v =>
            Object.keys(v.words)).flat().length }}</i></span>
          <div v-if="k === 'suffixes'" class="flex flex-col text-xs">
            <span v-for="(vv, kk) of {
              v: v.filter(vv => vv.partsOfSpeech.includes('v')).length,
              n: v.filter(vv => vv.partsOfSpeech.includes('n')).length,
              adj: v.filter(vv => vv.partsOfSpeech.includes('adj')).length,
              adv: v.filter(vv => vv.partsOfSpeech.includes('adv')).length,
              'v & n': v.filter(vv => vv.partsOfSpeech.includes('v') &&
                vv.partsOfSpeech.includes('n')).length,
              'v & adj': v.filter(vv => vv.partsOfSpeech.includes('v') &&
                vv.partsOfSpeech.includes('adj')).length,
              'n & adj': v.filter(vv => vv.partsOfSpeech.includes('n') &&
                vv.partsOfSpeech.includes('adj')).length,
              'adj & adv': v.filter(vv => vv.partsOfSpeech.includes('adj') &&
                vv.partsOfSpeech.includes('adv')).length
            }" :key="nanoid()">
              <i class="font-tight leading-tight">{{ kk }}</i>
              {{ ': ' }}
              <i class="font-bold leading-tight">{{ vv }}</i>
            </span>
          </div>
        </div>
      </summary>
      <div class="flex flex-wrap">
        <div v-for="vv of v" :key="nanoid()" :data-teleport="vv['id']"
          :class="['rounded flex items-center relative mr-2', dataTeleport === vv['id'] ? 'bg-slate-200 dark:bg-slate-700' : '']">
          <input type="checkbox" :name="vv['id']" :value="vv['id']" v-model="related" :disabled="search.length !== 0" />
          <i @click="dataTeleport = vv['id']"
            class="icon-[icon-park-solid--view-grid-detail] text-slate-500 cursor-pointer" />
          <i>{{ Object.keys(vv.words).join(',') }}</i>
        </div>
      </div>
    </details>
  </div>
  <Teleport v-if="dataTeleport !== null" :to="`[data-teleport='${dataTeleport}']`">
    <div v-if="dataTeleport !== null"
      class="p-2 rounded border border-slate-300 dark:border-slate-700 backdrop-blur-md bg-slate-200/10 dark:bg-slate-800/10 absolute top-full left-0 z-10">
      <i @click="dataTeleport = null"
        class="icon-[icon-park-solid--close-one] absolute top-0 right-0 translate-x-1/2 -translate-y-1/2 text-slate-500" />
      <table class="!m-0">
        <thead>
          <tr>
            <th v-for="v of ['same meaning', 'description']" :key="nanoid()"
              class="!p-0 whitespace-nowrap !text-xs !font-light">{{ v }}</th>
            <th class="!p-0 whitespace-nowrap !text-xs !font-light" v-if="detailed.partsOfSpeech !== undefined"
              :key="nanoid()">parts of speech</th>
          </tr>
        </thead>
        <tbody>
          <tr class="!bg-transparent">
            <td class="!p-0 min-w-[200px]" v-for="v of [detailed.sameMeaning, detailed.description]" :key="nanoid()">{{ v
            }}</td>
            <td class="!p-0" v-if="detailed.partsOfSpeech !== undefined">{{ detailed.partsOfSpeech.join(',')
            }}</td>
          </tr>
        </tbody>
      </table>
      <table class="!m-0">
        <thead>
          <tr class="!bg-transparent">
            <th class="!p-0 whitespace-nowrap !text-xs !font-light">suffix</th>
            <th class="!p-0 whitespace-nowrap !text-xs !font-light">meaning</th>
            <th class="!p-0 whitespace-nowrap !text-xs !font-light">descriptions</th>
          </tr>
        </thead>
        <tbody>
          <tr class="!bg-transparent" v-for="(v, k) of detailed" :key="nanoid()">
            <td class="!p-0 font-bold">{{ k }}</td>
            <td class="!p-0 min-w-[200px]">{{ v?.meaning }}</td>
            <td class="!p-0 min-w-[200px]">
              <ul class="!m-0">
                <li class="!m-0" v-for="vv of v?.descriptions" :key="nanoid()">{{ vv }}</li>
              </ul>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </Teleport>
  <div>
    <div v-show="results.length !== 0" class="flex flex-col">
      <div>
        <button
          class="rounded p-2 ring-2 ring-slate-200 transition-all duration-300 ease-in-out hover:ring-slate-300 hover:transition-all hover:duration-300 hover:ease-in-out dark:ring-slate-800 hover:dark:ring-slate-700"
          @click="copyResults">copy
          all {{ results.length }}</button>
      </div>
      <div class="flex flex-wrap">
        <div v-for="v of results" :key="nanoid()">
          <input type="checkbox" />
          <span :class="[
            'px-2',
            v === search
              ? 'text-rose-500 dark:text-rose-400'
              : '',
          ]
            ">
            {{ v }}
          </span>
        </div>
      </div>
    </div>
  </div>
</template>