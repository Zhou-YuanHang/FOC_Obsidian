---
title: IPMSM的αβ轴磁链推导(反推)+电压方程推导
slug: fp1qkheaz0lgcdho
created: 2026-03-24T17:29:41.000Z
updated: 2026-04-18T09:43:22.000Z
---

## 一、推导

推到思路

1、dq 轴的磁链方程是知道的

2、使用 park 逆变换到 αβ 轴的磁链方程

3、再把

所有推导均基于工业界通用的**等幅值正交变换**和理想电机假设：

1. **IPMSM d-q轴磁链方程**

![](https://cdn.nlark.com/yuque/__latex/617aaa3bbbde84ca8880dc16e8f5c227.svg)

2. **Park逆变换**

对磁链使用 park 逆变换

![](https://cdn.nlark.com/yuque/__latex/b8ab9011bde1edc8c259ef5db1a3da4d.svg)

对电流使用 park 变换

![](https://cdn.nlark.com/yuque/__latex/611736977e93917c5f9745b4d81e3c16.svg)

3. **转子电角速度定义**  
   复合函数求导的核心，所有三角函数的导数均来自此式：

![](https://cdn.nlark.com/yuque/__latex/5f60a125550c27169899c959295936ed.svg)

---

## 二、步骤1：展开α-β轴磁链的完整表达式

将式(2)的d-q磁链代入式(3)，得到IPMSM在α-β坐标系下的磁链完整形式，这是求导的基础：

![](https://cdn.nlark.com/yuque/__latex/70cf30d428bb3b2ed71035def514b48e.svg)

把 dq 轴电流带进去计算化简的结果，在正推的文章里展示了

![](https://cdn.nlark.com/yuque/0/2026/png/1963013/1775030300493-3f02c2a1-be1c-47ab-a456-d45840f05b51.png)

这其实就已经得到的 αβ 轴的磁链方程

---

## 三、步骤2：对ψα、ψβ做全微分（核心求导环节）

对式(6-1)(6-2)两边同时对时间![](https://cdn.nlark.com/yuque/__latex/cead1760d9d5723460c4b8d4028f113a.svg)求全导数，严格遵循**乘积求导法则**![](https://cdn.nlark.com/yuque/__latex/ccb232e3a7794364e3bc74672f68d2c4.svg)，![](https://cdn.nlark.com/yuque/__latex/4c96efe43a4c033dc8b7b342787067f6.svg)为恒定常数，导数为0。

### 2.1 求

拆分4项逐项求导：

![](https://cdn.nlark.com/yuque/__latex/c104ff9b4a68af1b884c8dece9fadfac.svg)

逐项展开：

1. 第一项：![](https://cdn.nlark.com/yuque/__latex/6f46c6786c6b7a76a2fec6e5a9bf6012.svg)
2. 第二项：![](https://cdn.nlark.com/yuque/__latex/eed743790ffaf16fde0dbee902063b85.svg)
3. 第三项：![](https://cdn.nlark.com/yuque/__latex/f186af6a29f27bfb3635038f6ac44929.svg)

合并得到![](https://cdn.nlark.com/yuque/__latex/5910ce10467abd6aacb8a2c3b75257fe.svg)的完整展开式：

![](https://cdn.nlark.com/yuque/__latex/56915eb20031649494caf273e79f4476.svg)

### 2.2 求

同理，对式(6-2)逐项求导：

![](https://cdn.nlark.com/yuque/__latex/b5ce873566f32b6d137b6e7bb78c1f3e.svg)

逐项展开合并后得到：

![](https://cdn.nlark.com/yuque/__latex/8f8b08e714add3de0ce30719aa3917b6.svg)

---

## 四、步骤3：利用Park正交变换化简交叉项

Park变换是正交变换，核心特性是**交叉项可完全抵消**，这是化简的关键。我们先对式(4)的电流变换式求导，得到dq轴电流的导数与α-β电流导数的关系：

![](https://cdn.nlark.com/yuque/__latex/ee600eeb1137782365fadacb25cf2245.svg)

![](https://cdn.nlark.com/yuque/__latex/5b130f0adf73c7eb19f995b615308086.svg)

### 关键化简结论（正交变换的核心优势）

将式(8-1)(8-2)代入式(7-1)(7-2)，利用![](https://cdn.nlark.com/yuque/__latex/52878b8e5b68fe65164248422bc47f20.svg)，交叉项全部抵消，最终可将![](https://cdn.nlark.com/yuque/__latex/5910ce10467abd6aacb8a2c3b75257fe.svg)、![](https://cdn.nlark.com/yuque/__latex/62eb54827b9c13874865e77fd084b6d9.svg)化简为：

![](https://cdn.nlark.com/yuque/__latex/b37e59a46e7d3e43a49d9e9ab92c2ac3.svg)

![](https://cdn.nlark.com/yuque/__latex/c25253c269cf55650723ec10bf893f44.svg)

---

## 五、步骤4：代入通用电压方程，得到最终结果

将式(9-1)(9-2)代入式(1)的α-β通用电压方程，直接得到图中的最终公式：

### 最终uα方程

![](https://cdn.nlark.com/yuque/__latex/a49cfacb73e32674e53a82e39d3ccd7d.svg)

### 最终uβ方程

![](https://cdn.nlark.com/yuque/__latex/bbe76cdc0a218332c9025176d163958c.svg)

这里的表达式结果和袁磊的 1-30 表达式是一样的：

![](https://cdn.nlark.com/yuque/0/2026/png/1963013/1775013556671-79df02d5-2b20-479d-b156-40d9e67a6a2b.png)