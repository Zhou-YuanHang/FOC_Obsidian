---
title: Resolver
slug: ny60x4wf9gggz4ns
created: 2026-03-23T01:59:49.000Z
updated: 2026-04-13T09:06:06.000Z
---

# 一、工作流程

![](https://cdn.nlark.com/yuque/0/2026/png/1963013/1774231682946-1c9241d6-49a4-495a-9e29-c89caca5f958.png)

# 二、FIR 滤波器

## (一) 设计关键参数

- 采样频率![](https://cdn.nlark.com/yuque/__latex/838c5b484246d573701f2b073c3a24e2.svg)
- 载波频率![](https://cdn.nlark.com/yuque/__latex/7b982df20227be2c01864dbc79d61736.svg)
- FIR 阶数
- 通带中心
- 通带带宽

调幅信号的边带分布在![](https://cdn.nlark.com/yuque/__latex/cf491bb3fd91905ff923d59a9b8ebe44.svg) 。为了不失真地解调出轴转速信息，滤波器必须完整保留这两个边带，因此带宽至少为![](https://cdn.nlark.com/yuque/__latex/e1691609067e2a0c3ee1e590ff2cb95e.svg)

## (二) 采样与降采样

文档中提到了一个重要的优化策略：**FIR运算与峰值采样结合，实现自然降采样**。

- **采样率160 kHz**：每个载波周期采集16个点。
- **峰值位置**：在载波的正负峰值附近（此时信噪比最高）进行FIR运算。
- **降采样比例**：

- 如果只取正峰值（或负峰值），则每周期输出1个有效样本 → **16:1降采样**。
- 如果正负峰值都取，则每周期输出2个有效样本 → **8:1降采样**。

这样做的好处：

1. **降低CPU负载**：后续观测器不需要处理全部160k样本，只需处理降采样后的数据流。
2. **提高信噪比**：只在信号幅度最大时采样，等效于提升了ADC的有效位数。

## (三) FIR 的延迟与补偿

FIR滤波器是有延迟的。对于一个N阶（N+1 taps）的FIR，其群延迟约为：

![](https://cdn.nlark.com/yuque/__latex/45547bd28932e8307248b21a5dd9f939.svg)

其中![](https://cdn.nlark.com/yuque/__latex/2814400bfeda8cea59483bf5852fe7ae.svg)

- 当 N=16，Fs=160kHz时，延迟 ≈ 16/(2×160k)=50μs。
- 由于采样点分布在载波周期内，这个延迟对应 **半个载波周期**（10 kHz载波周期100 μs，一半即50 μs）。

**补偿方法**：  
系统利用当前估算出的轴转速，在观测器中前向补偿这个固定延迟。文档图3的“Band pass delay compensation”模块就是做这件事的。这种补偿是可行的，因为延迟时间已知，且转速变化相对缓慢。

# 三、参考资料

![](https://cdn.nlark.com/yuque/0/2026/png/1963013/1774231610768-13109cfe-b0ab-464f-8e15-7c1fcd1a59c1.png)