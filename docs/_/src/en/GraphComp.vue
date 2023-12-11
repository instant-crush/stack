<script setup lang="ts">
import * as echarts from 'echarts'
import { onMounted, ref } from 'vue'
import { data } from './data'

data.nodes.forEach((v, k, a) => {
  a[k].name = v.id
  a[k].label = {
    show: true
  }
})
const dom = ref()
onMounted(() => {
  const diagram = echarts.init(dom.value)
  diagram.showLoading();
  diagram.setOption({
    animationDurationUpdate: 1500,
    animationEasingUpdate: 'quinticInOut',
    series: [
      {
        type: 'graph',
        layout: 'circular',
        // layout: 'force',
        roam: true,
        edgeSymbol: ['circle', 'arrow'],
        edgeSymbolSize: [0, 10],
        edgeLabel: {
          fontSize: 10
        },
        circular: {
          rotateLabel: true
        },
        // symbolSize: .01,
        data: data.nodes,
        links: data.links,
        categories: data.nodes.map(v => ({ name: v.id })),
        // lineStyle: {
        //   color: 'source',
        //   curveness: 0.3
        // },
        emphasis: {
          focus: 'adjacency',
        },
      }
    ]
  })
  diagram.hideLoading()
})

</script>
<template>
  <div class="w-full h-96" ref="dom" />
</template>