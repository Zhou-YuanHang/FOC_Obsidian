---
title: PMSM各种电感详解（偏直观理解）
slug: sknnrg8g13oi2f4t
created: 2026-03-30T13:26:05.000Z
updated: 2026-04-13T09:06:06.000Z
---

## 一、为什么要搞清楚电感？

电感是衡量**电流产生磁链能力**的物理量，而磁链直接决定电磁转矩的大小。  
PMSM 的数学模型中涉及多种电感概念，极易混淆：

|  |  |
| --- | --- |
| **电感名称** | **符号** |
| 自感 |  |
| 互感 |  |
| 漏感 |  |
| 励磁电感 |  |
| 等效励磁电感 |  |
| 同步电感 |  |
| 直轴同步电感 |  |
| 交轴同步电感 |  |

## 二、基本前提：绕组正方向的规定

建立三相模型前，必须**人为规定**每相绕组的电流正方向。

三相绕组 A、B、C 在空间上互差 120° 均匀分布，各相磁轴方向定义如下：

- A 相电流为正 → 磁通沿 A 轴正方向（0°）
- B 相电流为正 → 磁通沿 B 轴正方向（120°）
- C 相电流为正 → 磁通沿 C 轴正方向（240°）

---

## 三、自感

**定义：** 单个绕组通入电流后，自身电流产生的磁场与该绕组交链的磁链和电流的比值，![](https://cdn.nlark.com/yuque/__latex/953b7e49a7179aba1895abd753711f5e.svg)，分为漏感和励磁自感，或者说是产生的磁链分为漏磁链和励磁磁链

![](https://cdn.nlark.com/yuque/__latex/a1db20bd85fcba78480087561c4ea439.svg)

因此：

![](https://cdn.nlark.com/yuque/__latex/d9ed40ce025fbfad4f72df0ff5010d83.svg)

### 励磁磁链 vs 漏磁链

|  |  |  |
| --- | --- | --- |
| **磁链类型** | **磁路路径** | **对应电感** |
| **励磁磁链**（主磁链） | 穿越气隙，经过其他绕组形成闭合回路 | 励磁电感 |
| **漏磁链** | 不穿越气隙，在本相槽内就近闭合 | 漏感 |

**工程简化：** 设计良好的电机漏感很小，通常满足 ![](https://cdn.nlark.com/yuque/__latex/7b7b8a3967f241787d4e0d3fa55c6013.svg)，后续推导中可保留但不影响结构。

**对称性：** 由于三相绕组结构完全相同，各相自感相等：

![](https://cdn.nlark.com/yuque/__latex/f0bb683a5a69febae4a2797f86929e36.svg)

---

## 四、互感

**定义：：**一个绕组通电流时，产生的气隙主磁场与另一绕组交链的磁链，和该电流的比值，即![](https://cdn.nlark.com/yuque/__latex/ea555905a7a190fe8b613f7bcbbb8bfc.svg)。互感仅由主磁场产生，不含漏感分量，且满足互易性![](https://cdn.nlark.com/yuque/__latex/abbaa4cdf07f86bf3ee1421f79d6469c.svg)。

表征某相通入电流后，在其他相绕组中产生磁链的能力。

### 4.1 大小

A 相的励磁磁通需要经过 B、C 两条路径才能形成闭合回路。  
由几何对称性，磁通**各一半**通过 B 相和 C 相，因此 B、C 相感应到的磁链大小各为：

![](https://cdn.nlark.com/yuque/__latex/96316da6d985ee479020078f68baf957.svg)

这个 1/2 的关系必须是针对 SPMSM 的

![](https://cdn.nlark.com/yuque/0/2026/png/1963013/1774939405914-7fd2f501-fc6b-4932-a9a9-04e59b62116c.png)

### 4.2 符号（正负号）

关键问题：A 相磁通穿过 B 相绕组时，方向是否与 B 相正方向一致？

- A 相电流为正时，磁通沿 **A 轴方向（0°）**
- B 相绕组正方向为 **120°**
- A 相磁通穿过 B 相时，方向与 B 相正方向**相反**

→ 互感为**负值**：

![](https://cdn.nlark.com/yuque/__latex/5c633ac4781a3777dc4c0d894e48be40.svg)

### 4.3 对称性

由于三相完全对称，所有相间互感大小和符号均相等：

![](https://cdn.nlark.com/yuque/__latex/a8f8fa62bc355a340c7f39f4319ffb4c.svg)

---

## 五、三相磁链方程（ABC 坐标系）

考虑三相电流同时存在，以及永磁体对每相绕组的磁链贡献，完整磁链方程为：

![](https://cdn.nlark.com/yuque/__latex/7fa39300c6315cfe37707b4268d69afb.svg)

其中 ![](https://cdn.nlark.com/yuque/__latex/fac2e6c37cad1852329176b4200daddd.svg)、![](https://cdn.nlark.com/yuque/__latex/ead20084a0bb7d9419fd4b5e2f9836b7.svg)、![](https://cdn.nlark.com/yuque/__latex/aa31400969d9ab948693bfd0787739fb.svg) 为永磁体磁通链过各相绕组产生的磁链（随转子位置变化）。

**注意：** 此处的 ![](https://cdn.nlark.com/yuque/__latex/aba45c238cd223894cf45933304a0974.svg) 和 ![](https://cdn.nlark.com/yuque/__latex/6f5dde593f0bc27956e14b5eaec2ed17.svg) 对于 SPMSM 是常数，对于 IPMSM 则是随转子位置 ![](https://cdn.nlark.com/yuque/__latex/3ef0f4beff17eb0426a7430c8be423d0.svg) 变化的函数（详见第七节）。

---

## 六、等效励磁电感 与同步电感

### 6.1 利用三相平衡条件化简

三相平衡时有：![](https://cdn.nlark.com/yuque/__latex/1b0f52eca307e6ee9bd57d6afdeb421f.svg)，即 ![](https://cdn.nlark.com/yuque/__latex/c0a8a3f03052aec194c23575d6981956.svg)

代入 A 相磁链方程：

![](https://cdn.nlark.com/yuque/__latex/84c458a4e0ac49d97fb76a8451e3a596.svg)

![](https://cdn.nlark.com/yuque/__latex/8ab03ae4ef6c9f4f27f9ddbeb8c39f3a.svg)

展开：

![](https://cdn.nlark.com/yuque/__latex/06435427d352738ccc3c770d55630eef.svg)

### 6.2 等效励磁电感

![](https://cdn.nlark.com/yuque/__latex/a1851d2777d79accf09e9268a11ed111.svg)

原本 A 相自身的励磁电感只有 ![](https://cdn.nlark.com/yuque/__latex/853ab4de342c297508ec0c79e9df56aa.svg)，但三相平衡条件下，B、C 相电流对 A 相额外贡献了 ![](https://cdn.nlark.com/yuque/__latex/0b59cf511dac2a13c6a62b1155b60cc2.svg) 的磁链，合计变为 ![](https://cdn.nlark.com/yuque/__latex/fbdf08960cae7f600a110ccd960dfc64.svg)。  
"等效"的含义：用单相电流等效表达了三相共同作用的结果。

### 6.3 同步电感

![](https://cdn.nlark.com/yuque/__latex/95ce0f713588c8c1507236319218350c.svg)

经过化简，每相磁链方程极度简化，**只需本相电流**：

![](https://cdn.nlark.com/yuque/__latex/8067d8608942a0aeb572fb642b1cf5e8.svg)

![](https://cdn.nlark.com/yuque/__latex/2ee8fd0432b23b4c1852226e6dac95b5.svg) 是电机控制中最核心的参数，电流调节器设计、解耦前馈补偿均以此为基础。

---

## 七、SPMSM 与 IPMSM 的本质区别：气隙均匀性

到目前为止，推导对两种电机都通用。两者的分叉点在于**气隙是否均匀**。

### 7.1 SPMSM：气隙均匀

永磁体贴在转子表面，气隙处处相等。  
不管转子转到哪里，A 相绕组穿越气隙的磁路不变 → ![](https://cdn.nlark.com/yuque/__latex/aba45c238cd223894cf45933304a0974.svg) 是**常数**。

![](https://cdn.nlark.com/yuque/__latex/1f55bc2315b03424853c43e9cf6e2a7b.svg)

因此：

![](https://cdn.nlark.com/yuque/__latex/1781d3b0ff4ee363a07cb5401e587ea2.svg)

磁链方程（dq 坐标系）：

![](https://cdn.nlark.com/yuque/__latex/754b199c55d0257abd7e8d8b45f851f2.svg)

### 7.2 IPMSM：气隙不均匀

永磁体埋入转子铁心内部，转子结构不对称，气隙随转子位置变化：

|  |  |  |  |
| --- | --- | --- | --- |
| **方向** | **气隙特征** | **磁阻** | **等效电感** |
| **d 轴**（永磁体方向） | 磁通穿越磁体（，近似空气），**等效气隙大** | 大 | （**小**） |
| **q 轴**（超前 d 轴 90°） | 磁通全走铁心（），**仅物理气隙** | 小 | （**大**） |

由此导致 A 相自感随转子位置**以二倍频率正弦波动**：

![](https://cdn.nlark.com/yuque/__latex/07044e6fb9799a83c98deb42bbc36da1.svg)

其中：

![](https://cdn.nlark.com/yuque/__latex/2718ce475f0e4202354accaf95c53b04.svg)

![](https://cdn.nlark.com/yuque/__latex/4d5a00f039804895f2c3eb08987a0abb.svg) 随转子位置变化，存在两个特征值：

|  |  |  |  |
| --- | --- | --- | --- |
| **转子位置** | **取值** | **名称** | **大小** |
| **d 轴**正对 A 相绕组轴线 | 最小值 | **直轴同步电感** | 小 |
| **q 轴**正对 A 相绕组轴线 | 最大值 | **交轴同步电感** | 大 |

![](https://cdn.nlark.com/yuque/__latex/73dd76db4aac1341464332980bd9dd02.svg)

经 Park 变换后，dq 坐标系中的磁链方程（常系数）：

![](https://cdn.nlark.com/yuque/__latex/f5efe0c540440419b2d3fb369552021a.svg)

---

## 八、八个电感概念的层级关系

```
自感 L_AA = L_m + L_ls
│
├── 励磁电感 L_m ──×(3/2)──→ 等效励磁电感 L_eq
│                                     │
│                                 +L_ls ──→ 同步电感 L_s
│                                               │
│                              ┌────────────────┴────────────────┐
│                           SPMSM                             IPMSM
│                       （气隙均匀）                        （气隙不均匀）
│                      L_d = L_q = L_s                       L_d < L_q
│                                                        ↑              ↑
│                                               d轴对准时的极值    q轴对准时的极值
│                                                  （最小）            （最大）
│
└── 漏感 L_ls（槽漏、端部漏等，d/q 轴相同）

互感 M = -L_m/2（三相对称，全为负值，大小相等）
```

---

## 九、总结

|  |  |  |
| --- | --- | --- |
| **概念** | **公式** | **关键点** |
| 自感 |  | 本相电流产生本相磁链 |
| 互感 |  | 负号：空间互差120°，方向相反 |
| 等效励磁电感 |  | 三相平衡条件下的等效放大 |
| 同步电感 |  | 使磁链仅与本相电流相关 |
| 直轴同步电感 | （IPMSM 的最小值） | d 轴气隙大，电感小 |
| 交轴同步电感 | （IPMSM 的最大值） | q 轴气隙小，电感大 |
| SPMSM |  | 气隙均匀，无凸极 |
| IPMSM |  | 气隙不均匀，有凸极，有磁阻转矩 |

![](https://cdn.nlark.com/yuque/0/2026/png/1963013/1774945663865-231e4cb2-cc59-465d-8f62-4ac2fa632521.png)