---
title: abc到αβ的电感矩阵变换注意点
slug: ger1banso1a6dpt5
created: 2026-04-07T16:51:21.000Z
updated: 2026-04-13T09:06:06.000Z
---

### 核心结论

**电感矩阵是描述「电流矢量→磁链矢量」映射的二阶张量，不是一维矢量；坐标变换时必须同时对「输入（电流）」和「输出（磁链）」做同步的坐标系映射，因此需要左乘Clark变换矩阵**![](https://cdn.nlark.com/yuque/__latex/6c54abc2feaa200dda4592eb53b86e05.svg)**（对应磁链的正变换）、右乘**![](https://cdn.nlark.com/yuque/__latex/6c54abc2feaa200dda4592eb53b86e05.svg)**的逆（正交变换下等于转置**![](https://cdn.nlark.com/yuque/__latex/1bdbcd266240b598134583987a843619.svg)**，对应电流的逆变换），不能只左乘一个变换矩阵。**

下面从物理本质到数学推导，完整拆解清楚：

---

## 一、先明确不可违背的基础物理约束

无论在哪个坐标系，磁链和电流的核心关系始终成立：

![](https://cdn.nlark.com/yuque/__latex/4b69643a10b60e151e75a21d87690bac.svg)

- abc坐标系下：![](https://cdn.nlark.com/yuque/__latex/304f91ab269b43a361c98e02cdf055e4.svg)
- αβ坐标系下：![](https://cdn.nlark.com/yuque/__latex/a4d4137c3cf326ace19b082f96aae706.svg)

电感矩阵![](https://cdn.nlark.com/yuque/__latex/fac66dd8c0394e902643a0517bc54434.svg)的本质，是**同一坐标系下，电流矢量到磁链矢量的线性映射矩阵**，属于二阶张量。

- 一维矢量（电流、磁链）的坐标变换，只需要一次左乘变换矩阵；
- 二阶张量的坐标变换，必须对「输入的电流」和「输出的磁链」两端都做坐标系匹配，这就是双乘变换矩阵的核心原因。

---

## 二、完整推导电感矩阵的变换规则

### 1. 先明确Clark变换的两个核心关系

Clark变换是abc与αβ坐标系的矢量映射规则，**电流和磁链都是空间矢量，遵循完全相同的变换规则**：

1. 正变换（abc→αβ）：![](https://cdn.nlark.com/yuque/__latex/7d519f49937609f66c4fe153400b722a.svg)，![](https://cdn.nlark.com/yuque/__latex/262a87797a8b78c1921800c29b095755.svg)
2. 逆变换（αβ→abc）：![](https://cdn.nlark.com/yuque/__latex/73c35d89668b62b3a225f470d4b7b801.svg)，![](https://cdn.nlark.com/yuque/__latex/2f108e1395cdf7fbd8a484b612751542.svg)

关键误区提醒：很多人只记得电流要做Clark变换，却忽略了磁链作为矢量，也要做完全相同的坐标系变换，这是疑惑“多了一个右乘项”的核心原因。

### 2. 一步步推导变换公式

我们把abc坐标系的磁链方程，完整映射到αβ坐标系：

1. 从abc的磁链方程出发：

![](https://cdn.nlark.com/yuque/__latex/304f91ab269b43a361c98e02cdf055e4.svg)

2. 两边同时左乘![](https://cdn.nlark.com/yuque/__latex/6c54abc2feaa200dda4592eb53b86e05.svg)，把左侧的abc磁链转换为αβ磁链：

![](https://cdn.nlark.com/yuque/__latex/311aa1635535f12c9d6d289a4d57e016.svg)

3. 左侧根据正变换规则，直接等于![](https://cdn.nlark.com/yuque/__latex/77756c8bc6cc1e6346a3f7058cebea1d.svg)，式子简化为：

![](https://cdn.nlark.com/yuque/__latex/3edb5086b2237b38921e84283b226890.svg)

4. 把右侧的abc电流，用逆变换替换为αβ电流：![](https://cdn.nlark.com/yuque/__latex/73c35d89668b62b3a225f470d4b7b801.svg)，代入后得到：

![](https://cdn.nlark.com/yuque/__latex/70df7a825ce375fda0a0b82731d6423f.svg)

5. 对比αβ坐标系的磁链方程![](https://cdn.nlark.com/yuque/__latex/a4d4137c3cf326ace19b082f96aae706.svg)，直接得到电感矩阵的通用变换规则：

![](https://cdn.nlark.com/yuque/__latex/5572f7628d151960f601c2abbfb3f2d0.svg)

---

## 三、为什么逆矩阵变成了转置？

因为**等幅值Clark变换矩阵是标准的正交矩阵**，正交矩阵有一个核心数学特性：矩阵的逆等于它的转置，即![](https://cdn.nlark.com/yuque/__latex/8c393ed9d93439e11ef2916380e88440.svg)。

我们可以直接验证：  
等幅值Clark变换矩阵为：

![](https://cdn.nlark.com/yuque/__latex/9bd1b07544e5b1bdeb1d60962262c35b.svg)

它的逆矩阵，恰好等于它的转置：

![](https://cdn.nlark.com/yuque/__latex/cdaa98dc9e70b89deb0fc4a722d51ef6.svg)

因此，电感矩阵的变换规则，就可以写成我们看到的最终形式：

![](https://cdn.nlark.com/yuque/__latex/106450c605427f71876176c2f0bd50ab.svg)

---

## 四、核心误区澄清：为什么不能只左乘一个？

如果只左乘一个变换矩阵，得到的![](https://cdn.nlark.com/yuque/__latex/12bbeebb1fb62645641852bd9770c1be.svg)没有任何物理意义：

- 它的输入是abc坐标系的电流![](https://cdn.nlark.com/yuque/__latex/8695945630fe39cc30732aaa00c18875.svg)，输出却是αβ坐标系的磁链![](https://cdn.nlark.com/yuque/__latex/77756c8bc6cc1e6346a3f7058cebea1d.svg)，是跨坐标系的混乱映射，不是αβ坐标系下的电感矩阵；
- 电感矩阵必须满足「同一坐标系下，电流到磁链的映射」，因此必须把输入的电流也变换到αβ坐标系，这就是右乘逆矩阵（转置）的核心意义。

### 通俗类比理解

你可以把电感矩阵想象成一个翻译官：

- abc坐标系的翻译官![](https://cdn.nlark.com/yuque/__latex/1e410e8095c843d509362bef07ca35b2.svg)，只会把「abc电流语言」翻译成「abc磁链语言」；
- 你需要的αβ翻译官![](https://cdn.nlark.com/yuque/__latex/c4933b1c9b13ab97fac90d15bf0b0fe7.svg)，必须能把「αβ电流语言」翻译成「αβ磁链语言」；
- 完整的翻译流程是：

1. 先把αβ电流，逆翻译成abc电流（右乘![](https://cdn.nlark.com/yuque/__latex/892c9717de8c0e3a0e6c87c20c935c5d.svg)）；
2. 交给abc翻译官![](https://cdn.nlark.com/yuque/__latex/1e410e8095c843d509362bef07ca35b2.svg)，翻译成abc磁链；
3. 再把abc磁链，正翻译成αβ磁链（左乘![](https://cdn.nlark.com/yuque/__latex/6c54abc2feaa200dda4592eb53b86e05.svg)）；

- 三步合起来，就是![](https://cdn.nlark.com/yuque/__latex/b52ffb08913dabe6a31bd7572505f9f3.svg)，也就是我们推导的变换规则。