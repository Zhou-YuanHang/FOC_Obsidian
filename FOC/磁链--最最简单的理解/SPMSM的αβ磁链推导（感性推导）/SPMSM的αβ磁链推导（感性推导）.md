---
title: SPMSM的αβ磁链推导（感性推导）
slug: oe6f3iqny6n90bip
created: 2026-03-24T14:51:40.000Z
updated: 2026-04-22T16:36:54.000Z
---

## 一、先明确核心前提：磁链的本质与坐标系的意义

定子全磁链 = 定子电流产生的电枢反应磁链 + 永磁体磁链的分量，即：

![](https://cdn.nlark.com/yuque/__latex/5c87784643a30dd979629030ea78b26a.svg)

## 二、为什么SPMSM可以直接写出α-β轴磁链方程

SPMSM的核心结构特点是：永磁体贴在转子表面，**电机气隙均匀，无凸极效应**，直接导致了一个关键结论:![](https://cdn.nlark.com/yuque/__latex/dc4e2640ddb310122d2f881789a1fe1a.svg)

### 1. 电感的各向同性是核心

均匀气隙意味着：**无论定子电流在空间哪个方向（α轴、β轴、d轴、q轴，或任意角度），电流产生的磁场遇到的磁阻完全相同**，对应的定子绕组电感是一个**与转子位置**![](https://cdn.nlark.com/yuque/__latex/d0427b08999fd3b56586dac53a94cfb3.svg)**无关、与电流方向无关的恒定常数**![](https://cdn.nlark.com/yuque/__latex/2ee8fd0432b23b4c1852226e6dac95b5.svg)。

换句话说，在α-β坐标系下，α轴和β轴的等效电感都是![](https://cdn.nlark.com/yuque/__latex/2ee8fd0432b23b4c1852226e6dac95b5.svg)，没有交叉耦合，也不随转子转动变化。

### 2. 直接写α-β磁链

- 电枢反应磁链：α轴电流![](https://cdn.nlark.com/yuque/__latex/0fd9f3da87e8296b1aec90b87fc0fec6.svg)产生的磁链就是![](https://cdn.nlark.com/yuque/__latex/50ae70a4c6ea900d1d5b992781a00b4d.svg)，β轴电流![](https://cdn.nlark.com/yuque/__latex/69e985750f03b0cf48f0332288521944.svg)产生的磁链就是![](https://cdn.nlark.com/yuque/__latex/6c776240560539e9a7fe46d205cfcf6e.svg)，二者正交独立，无交叉项；
- 永磁体励磁磁链：幅值恒定为![](https://cdn.nlark.com/yuque/__latex/ffc7d77559a76cccc1ebbb2c68e9dd0c.svg)，方向与d轴重合，d轴与α轴的夹角为转子电角度![](https://cdn.nlark.com/yuque/__latex/d0427b08999fd3b56586dac53a94cfb3.svg)，因此在α-β轴的投影天然就是![](https://cdn.nlark.com/yuque/__latex/764e290dcd386624f68198f19d797170.svg)（α轴）和![](https://cdn.nlark.com/yuque/__latex/34d2fd5639a39ef904a2d8167816eecd.svg)（β轴）。

二者直接相加，就得到了：

![](https://cdn.nlark.com/yuque/__latex/72dd33b86919725bcd1831a982b4d81c.svg)

### 补充验证：SPMSM从dq轴反推，结果完全一致

SPMSM不是不能从dq轴反推，而是反推后交叉项完全抵消，直接写更简洁。我们可以简单推导验证：

1. SPMSM的dq轴磁链方程：![](https://cdn.nlark.com/yuque/__latex/af64add082f33905575c0d870f00eb31.svg)，![](https://cdn.nlark.com/yuque/__latex/44a0a1816f333c6a9241228b5ba39da4.svg)
2. Park逆变换（dq→αβ）：![](https://cdn.nlark.com/yuque/__latex/d26e8f67fc3c80e1a0c537b4a0251022.svg)，![](https://cdn.nlark.com/yuque/__latex/6af9f982f6b3c111a954836ab080267f.svg)
3. 代入dq轴电流与αβ电流的关系：![](https://cdn.nlark.com/yuque/__latex/e8b7a6013a4242d983216f687744c8fc.svg)，![](https://cdn.nlark.com/yuque/__latex/5270a9f7a6350628d8699104cd6c86c8.svg)
4. 展开后，![](https://cdn.nlark.com/yuque/__latex/c9b07071945fbea70a187889cc0e840b.svg)，交叉项完全抵消，最终结果和公式4完全相同。

---

## 三、为什么IPMSM工程上都从dq轴反推α-β磁链，而非直接写

IPMSM的核心结构特点是：永磁体嵌入转子铁芯内部，**d轴（永磁体方向）磁导率接近空气，磁阻大；q轴为铁芯磁路，磁阻小**，存在强烈的凸极效应，直接导致：**直轴电感**![](https://cdn.nlark.com/yuque/__latex/4370bf3af6bebcc9b7d2746b6fe397cb.svg) **交轴电感**![](https://cdn.nlark.com/yuque/__latex/92f16a7f1fbdc9cb4103716794c3128f.svg)。

### 1. α-β轴的等效电感是时变的，无法用固定常数表示

凸极效应的磁阻不对称，是**相对于转子的d-q轴固定的**，而d-q轴随转子旋转，因此在静止的α-β坐标系下，定子绕组的等效磁阻会随转子位置![](https://cdn.nlark.com/yuque/__latex/d0427b08999fd3b56586dac53a94cfb3.svg)周期性变化，对应的等效电感是**转子位置的时变函数**，而非恒定常数。

我们可以用一个极端例子直观感受：

假设定子只有α轴电流![](https://cdn.nlark.com/yuque/__latex/d17d7841ecd7d0e028bafb7341d0f625.svg)此时：

- 电流在dq轴的分量：![](https://cdn.nlark.com/yuque/__latex/f0df6b2ca445f2dff4730b34e43b803c.svg)
- 电枢反应磁链在dq轴的分量：![](https://cdn.nlark.com/yuque/__latex/63643885939c825e89012d36851b5b4c.svg)
- 投影回α轴的电枢反应磁链：![](https://cdn.nlark.com/yuque/__latex/7a0a8bb7e943819ac143aa81a883c1d3.svg)代入![](https://cdn.nlark.com/yuque/__latex/2871e2f1501ae293101468264b0499cd.svg)、![](https://cdn.nlark.com/yuque/__latex/575ae8f180efca11b8a77f7e1228bdfd.svg)展开后得到：

![](https://cdn.nlark.com/yuque/__latex/269a246f126b28e4ec7be4ccb47fa734.svg)

会发现，α轴的等效电感是![](https://cdn.nlark.com/yuque/__latex/4cd7f526bd2ecc66480d12205c919a81.svg)，它随转子位置![](https://cdn.nlark.com/yuque/__latex/d0427b08999fd3b56586dac53a94cfb3.svg)以2倍电频率周期变化，是一个时变参数。同理，β轴的等效电感、α-β轴的交叉耦合电感，也都是![](https://cdn.nlark.com/yuque/__latex/d0427b08999fd3b56586dac53a94cfb3.svg)的时变函数。

### 2. 直接写α-β磁链的弊端

如果硬要直接在α-β坐标系写IPMSM的磁链方程，会得到如下形式：

![](https://cdn.nlark.com/yuque/__latex/0e31450a8d8d923fe55e2c98df22dee6.svg)

这个方程存在两个致命问题：

1. **形式极度复杂**：电感是带2倍频的时变函数，还有交叉耦合项，后续求导推导电压方程时，会产生大量复杂的微分项，极易出错；
2. **物理意义完全模糊**：凸极效应、磁阻变化的核心特性，被淹没在时变电感的三角函数里，无法直观体现，也不利于后续的控制器设计（比如磁链观测、转矩控制）。

### 3. 问题

我们观察表达式一和表达式二可以发现：

1. IPMSM 的 α 磁链表达式里面包含了 α 和 β 的互感
2. SPMSM 的 α 磁链表达式里没有看出来 αβ 的互感

按照之前对于磁链的理解，IPMSM 是正确的，SPMSM 貌似少了一个互感，这是不是意味着之前直接写的 SPMSM 磁链是错误的。

先给出结论，直接写的公式没有错。

在 abc 坐标系下的电感矩阵如下图：（只对 SPMSM 成立）

![](https://cdn.nlark.com/yuque/0/2026/png/1963013/1775580280975-110b5824-5890-45d3-a774-e756dac3e94e.png)

我们对电感进行 clark 变换

![](https://cdn.nlark.com/yuque/0/2026/png/1963013/1775580565523-1be344a8-f839-4fda-9b5b-8ae251aff43d.png)

这里需要注意，表达式没有错，是要除了左乘 clark 表达式，还要右乘一个 clark 表达式的转置。

[[abc到αβ的电感矩阵变换注意点]]

进行 clark 坐标变换后得到：

![](https://cdn.nlark.com/yuque/0/2026/png/1963013/1775580902701-8bf029c2-7714-4642-842d-184a76ea583d.png)

可以清晰看到：变换后的电感矩阵是**纯对角矩阵**，非对角项（α、β 轴之间的互感）完全抵消为 0，α、β 轴的自感均为恒定常数 Ls，和文档中 SPMSM 的 αβ 磁链方程完全对应。

![](https://cdn.nlark.com/yuque/0/2026/png/1963013/1776875790564-b329742d-8309-437e-a2b5-ec50a7737da8.png)

还可以有另外的解释：

[[对于SPMSM，在abc坐标系下存在abc的互感，到αβ坐标系就没有αβ之间的互感了]]