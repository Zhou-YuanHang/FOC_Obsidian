---
title: IPMSM电感核心公式的底层推导与物理意义详解
slug: mee1kxccm15dbffu
created: 2026-03-30T16:59:57.000Z
updated: 2026-04-13T09:06:06.000Z
---

你困惑的两个核心问题，本质是**交流电机电感的物理拆分规则**和**凸极效应带来的气隙磁导周期性变化**，我从最底层的物理定义出发，一步步正向推导，彻底讲清每一项的来源，全程不跳步、不硬套公式。

---

## 一、先搞懂核心底层定义：电感的本质

电感的通用物理定义：**单位电流产生的、与绕组交链的磁链**，公式为：

![](https://cdn.nlark.com/yuque/__latex/c45c89e39b58cd87a00716e7ad3b5e14.svg)

其中：

- ![](https://cdn.nlark.com/yuque/__latex/459f3c80a50b7be28751b0869ef5386a.svg)为绕组有效串联匝数，![](https://cdn.nlark.com/yuque/__latex/8456c30c0d08ea621bbda08077638dd7.svg)为绕组电流产生的磁通，![](https://cdn.nlark.com/yuque/__latex/49c74c5b64efe2d3da41a3e3dd2bff39.svg)为绕组交链的总磁链；
- 磁通的本质是**磁动势F除以磁阻Rm**，即![](https://cdn.nlark.com/yuque/__latex/29981e93562faf4f188a02c3832a4fe4.svg)，![](https://cdn.nlark.com/yuque/__latex/01b16845e11b1ce1a079ac71691c05a2.svg)为磁导（磁阻的倒数，磁导越大，相同磁动势产生的磁通越多）。

所有电机的电感公式，都从这个最基础的定义衍生而来。

---

## 二、第一个问题：、的完整来源

这个公式是**定子绕组磁链的物理拆分**，是所有交流电机的通用规则，只是IPMSM的凸极特性让d/q轴的主电感出现差异。

### 1. 定子绕组磁通的两部分拆分

定子绕组通电流后，产生的磁通分为完全独立的两部分，对应两个独立的电感分量：

|  |  |  |  |
| --- | --- | --- | --- |
| **磁通类型** | **物理意义** | **对应电感** | **特性** |
| 漏磁通 | 只和定子绕组自身交链，**不穿过气隙进入转子**，仅存在于定子槽内、绕组端部 | 定子漏感 | 恒定值，和转子位置、凸极结构、d/q轴完全无关 |
| 主磁通（气隙磁通） | 穿过气隙进入转子，和定子、转子同时交链，是产生电磁转矩的核心磁通 | 主电感（电枢反应电感） | 由气隙磁路的磁导决定，IPMSM凸极结构导致d/q轴磁导不同，因此分为（d轴主电感）和（q轴主电感） |

### 2. d/q轴同步电感的合成

同步旋转dq坐标系的核心特点是：**d轴电流**![](https://cdn.nlark.com/yuque/__latex/2871e2f1501ae293101468264b0499cd.svg)**产生的磁动势完全沿转子d轴，q轴电流**![](https://cdn.nlark.com/yuque/__latex/575ae8f180efca11b8a77f7e1228bdfd.svg)**产生的磁动势完全沿转子q轴，二者正交完全解耦**。

- 对于d轴：![](https://cdn.nlark.com/yuque/__latex/2871e2f1501ae293101468264b0499cd.svg)产生的总磁链 = 漏磁链 + d轴主磁链，两边除以![](https://cdn.nlark.com/yuque/__latex/2871e2f1501ae293101468264b0499cd.svg)，得到d轴总同步电感：

![](https://cdn.nlark.com/yuque/__latex/b5b067be8b41e0035a5170d758b0976a.svg)

- 对于q轴：![](https://cdn.nlark.com/yuque/__latex/575ae8f180efca11b8a77f7e1228bdfd.svg)产生的总磁链 = 漏磁链 + q轴主磁链，同理得到q轴总同步电感：

![](https://cdn.nlark.com/yuque/__latex/43a78fe860fc8654bd60bd95d36b6841.svg)

### 3. IPMSM的核心特性：的原因

内置式永磁同步电机的转子d轴是永磁体安装位置，永磁体的磁导率接近空气，**d轴磁路的等效气隙大、磁阻大、磁导小**；而q轴是铁芯磁路，等效气隙小、磁阻小、磁导大。

根据电感与磁导成正比的关系，磁导越小，电感越小，因此：

![](https://cdn.nlark.com/yuque/__latex/27cf8133bf6e8364183b6ff067680743.svg)

补充：表贴式永磁同步电机SPMSM气隙均匀，![](https://cdn.nlark.com/yuque/__latex/bcddd6d565b59ea1624ea5d45f3c0bd9.svg)，因此![](https://cdn.nlark.com/yuque/__latex/f1b81ef783537f8b01e7ea9827378a51.svg)，最终![](https://cdn.nlark.com/yuque/__latex/26a0b96ddd83f547c8e27d46a2e70967.svg)，和IPMSM形成本质区别。

---

## 三、第二个问题：A相自感的完整推导

你困惑的![](https://cdn.nlark.com/yuque/__latex/cb82c6b15d27639e92b23a5e37b03ca2.svg)项，**核心来源是凸极电机的气隙磁导随转子位置呈2倍电角度周期变化**，我们用电机学通用的**绕组函数法**（电感计算的标准方法）正向推导，全程讲清每一步的物理意义。

### 1. 前置1：绕组函数的定义

绕组函数![](https://cdn.nlark.com/yuque/__latex/1531d8562296cc6fa0c1d58e51cb78a6.svg)的物理意义：**绕组x通1A电流时，在气隙圆周空间电角度**![](https://cdn.nlark.com/yuque/__latex/18d25ca4f77a9bbed9812e2bb0b350a5.svg)**处产生的磁动势分布**，![](https://cdn.nlark.com/yuque/__latex/6b3435551431f0c7b771d2ccc5582662.svg)对应定子A相绕组轴线。

三相对称定子绕组的基波绕组函数为：

![](https://cdn.nlark.com/yuque/__latex/91369d1ce9afe473372e8935abec3450.svg)

其中![](https://cdn.nlark.com/yuque/__latex/459f3c80a50b7be28751b0869ef5386a.svg)为绕组有效串联匝数，该式是正弦绕组的理想基波近似，忽略高次谐波。

### 2. 前置2：凸极电机的气隙磁导分布（核心！的根源）

气隙磁导![](https://cdn.nlark.com/yuque/__latex/16fc9980effcb670200fcae72abaa871.svg)是气隙圆周位置![](https://cdn.nlark.com/yuque/__latex/18d25ca4f77a9bbed9812e2bb0b350a5.svg)和转子位置![](https://cdn.nlark.com/yuque/__latex/3ef0f4beff17eb0426a7430c8be423d0.svg)的函数，![](https://cdn.nlark.com/yuque/__latex/3ef0f4beff17eb0426a7430c8be423d0.svg)是转子d轴与A相轴线（![](https://cdn.nlark.com/yuque/__latex/6b3435551431f0c7b771d2ccc5582662.svg)）的电角度。

#### （1）隐极电机的气隙磁导

隐极电机（SPMSM）气隙均匀，磁导是恒定值，不随位置变化：

![](https://cdn.nlark.com/yuque/__latex/db78c251b1a43e08899c0b8082d27803.svg)

#### （2）IPMSM凸极电机的气隙磁导

IPMSM转子凸极结构的核心特点：**磁导分布关于d轴、q轴对称，转子转过180°电角度，磁导分布完全重复**（d轴转180°后，磁路和原位置完全一致）。

因此，气隙磁导沿圆周的傅里叶级数展开，**最低次的非恒定分量是2次谐波**（1次谐波被对称结构抵消），最终表达式为：

![](https://cdn.nlark.com/yuque/__latex/5ec5a28ea57c9fe21af959fed90e83f5.svg)

其中：

- ![](https://cdn.nlark.com/yuque/__latex/2d98577399fca29bd9568aa9704319f9.svg)：气隙磁导的恒定分量（平均磁导），![](https://cdn.nlark.com/yuque/__latex/9d05525394bb394c03fad277008c01cb.svg)；
- ![](https://cdn.nlark.com/yuque/__latex/f702032e1923abbde4798ca9afe40a4e.svg)：2次谐波磁导的幅值，![](https://cdn.nlark.com/yuque/__latex/1e6e90dbf8638ab71beff56705df596f.svg)；
- ![](https://cdn.nlark.com/yuque/__latex/ddb4ad0ffd7978acf915634ab9b4b0c4.svg)：核心！解释了为什么是![](https://cdn.nlark.com/yuque/__latex/74ead41501dc027f34ea475564c255d6.svg)而非![](https://cdn.nlark.com/yuque/__latex/3ef0f4beff17eb0426a7430c8be423d0.svg)：

- ![](https://cdn.nlark.com/yuque/__latex/88a365286e201be434ca5fe00e9d521b.svg)是定子空间位置![](https://cdn.nlark.com/yuque/__latex/18d25ca4f77a9bbed9812e2bb0b350a5.svg)相对于转子d轴的角度；
- 当![](https://cdn.nlark.com/yuque/__latex/6ed537018b53bc929894866b2355ab41.svg)（d轴对准该位置）和![](https://cdn.nlark.com/yuque/__latex/b7236ca99b23f57e63d63c72502461b1.svg)时，磁导完全相同，周期为180°电角度，对应角频率为2倍电角速度，因此是![](https://cdn.nlark.com/yuque/__latex/ddb4ad0ffd7978acf915634ab9b4b0c4.svg)。

补充：IPMSM中![](https://cdn.nlark.com/yuque/__latex/a5fcaac71d709acef2eaa34694b11111.svg)，因此![](https://cdn.nlark.com/yuque/__latex/f702032e1923abbde4798ca9afe40a4e.svg)为负值，当d轴对准A相（![](https://cdn.nlark.com/yuque/__latex/cc2d071959cad893968819e1787c81a0.svg)）时，A相位置的磁导最小，符合物理实际。

### 3. 绕组电感的通用计算公式

绕组函数法给出了任意两个绕组间电感的通用积分公式，自感是两个绕组为同一相的特殊情况：

![](https://cdn.nlark.com/yuque/__latex/267e1b96c4c3e9e628939eaad272dbd2.svg)

其中：![](https://cdn.nlark.com/yuque/__latex/f0ae8a7287d2b14898997324b9905c00.svg)为真空磁导率，![](https://cdn.nlark.com/yuque/__latex/72cb3a229067770aeb6caa625a65a1a1.svg)为定子内径，![](https://cdn.nlark.com/yuque/__latex/6945e109777fe3fd777e8254f0ec0f0c.svg)为铁芯叠长，![](https://cdn.nlark.com/yuque/__latex/d4cd21d60552e207f237e82def9029b6.svg)为电机极对数，积分区间为整个气隙圆周（0到2π电角度）。

### 4. A相自感的正向推导

将A相绕组函数![](https://cdn.nlark.com/yuque/__latex/5d2a4d84e90a7844f13c27150de20bdc.svg)和气隙磁导![](https://cdn.nlark.com/yuque/__latex/60cc5c710a46a3c01987ccbe4a564bf2.svg)代入自感公式：

![](https://cdn.nlark.com/yuque/__latex/6b04b4336fb86c23d66a6b5ed49f61e3.svg)

#### 步骤1：化简绕组函数的平方项

用三角恒等式![](https://cdn.nlark.com/yuque/__latex/0dece35a48a968831bd0fcf57cada2d9.svg)展开：

![](https://cdn.nlark.com/yuque/__latex/e1d60ff25f58531d2e92e95bb183e859.svg)

#### 步骤2：展开积分式，拆分为4个独立积分

![](https://cdn.nlark.com/yuque/__latex/bf415e4671997fdc81fc69c298b06bbe.svg)

#### 步骤3：逐个计算积分（核心化简）

利用**余弦函数在整周期（0到2π）内积分值为0**的特性，快速化简：

1. 第1个积分：![](https://cdn.nlark.com/yuque/__latex/e47ba869083056c2b5aa91ee9033376d.svg)（唯一非零的恒定项）；
2. 第2个积分：![](https://cdn.nlark.com/yuque/__latex/ce003ad98f0bb1464b7c5c5a85e2c9e6.svg)（余弦整周期积分归零）；
3. 第4个积分：![](https://cdn.nlark.com/yuque/__latex/875f5837cfc02889b499fed2cccf7e3f.svg)（同理归零）；
4. 第3个积分：用积化和差公式![](https://cdn.nlark.com/yuque/__latex/888fa5adf248b575c46f3fa585037209.svg)展开，令![](https://cdn.nlark.com/yuque/__latex/052ff2dcace43655e8f09838ae3c872c.svg)，![](https://cdn.nlark.com/yuque/__latex/337d9c935a16bc713a5232b847368107.svg)：

![](https://cdn.nlark.com/yuque/__latex/6929f39f4ed97f46abdb667883ddd8ee.svg)

5. 代入积分：

![](https://cdn.nlark.com/yuque/__latex/a1479b062f36998b3101e0de3ce57eec.svg)

6. 其中![](https://cdn.nlark.com/yuque/__latex/6c5afe17a021cfa0e89a5eab21411529.svg)整周期积分归零，![](https://cdn.nlark.com/yuque/__latex/cb82c6b15d27639e92b23a5e37b03ca2.svg)是与![](https://cdn.nlark.com/yuque/__latex/18d25ca4f77a9bbed9812e2bb0b350a5.svg)无关的常数，积分得![](https://cdn.nlark.com/yuque/__latex/da4a9ac20620955b2da36bbffae0b6ad.svg)，因此最终结果：

![](https://cdn.nlark.com/yuque/__latex/7471a6668df0216a9f0a08359147a9b1.svg)

#### 步骤4：代入积分结果，得到最终自感表达式

将非零的积分结果代回，化简得：

![](https://cdn.nlark.com/yuque/__latex/80118a53d1ba71ab5cc74841694763e8.svg)

这里的![](https://cdn.nlark.com/yuque/__latex/8369ea4ed2f3c3dfd901f03df646939c.svg)和![](https://cdn.nlark.com/yuque/__latex/c65f81abe24f65ae0ee363510baf1ada.svg)是**主电感的恒定分量和变化分量幅值**，再加上与转子无关的定子漏感![](https://cdn.nlark.com/yuque/__latex/57fb2312b1817199e91ba0c31525d358.svg)，就得到了你看到的A相自感完整表达式：

![](https://cdn.nlark.com/yuque/__latex/5e8ac0f5b27ac687517838d098dd3837.svg)

其中：

- ![](https://cdn.nlark.com/yuque/__latex/f0b3146aa84eeda704e70d3a1d7c3cde.svg)：自感的恒定主电感分量，![](https://cdn.nlark.com/yuque/__latex/e4e094275218ba978f512267fee80d83.svg)；
- ![](https://cdn.nlark.com/yuque/__latex/12ea5d8dd1e9b2b63ca602dd183dde08.svg)：自感的2倍频变化分量幅值，![](https://cdn.nlark.com/yuque/__latex/06f6f19ad7576ca8ad226b09a5dbea19.svg)。

### 5. 关键对应：与的关系

将![](https://cdn.nlark.com/yuque/__latex/9d05525394bb394c03fad277008c01cb.svg)、![](https://cdn.nlark.com/yuque/__latex/1e6e90dbf8638ab71beff56705df596f.svg)，以及![](https://cdn.nlark.com/yuque/__latex/1da0999307968c3b6cc00112f727e08b.svg)、![](https://cdn.nlark.com/yuque/__latex/1f5840210100ccc7e6af69593895d4d9.svg)代入，可直接得到用![](https://cdn.nlark.com/yuque/__latex/c5fceb5714dcbea932ccc01eea36c7b0.svg)表示的自感公式：

![](https://cdn.nlark.com/yuque/__latex/0cbc46798e1a72f5a4f314bfa9221b6b.svg)

验证：IPMSM中![](https://cdn.nlark.com/yuque/__latex/b8e62a7cbb1a465232c56d8a0d5cb3d4.svg)，![](https://cdn.nlark.com/yuque/__latex/2b3f7f183cda1b8ef307db0bebc59103.svg)，则![](https://cdn.nlark.com/yuque/__latex/002b1bacbf7cdac0db9c389e0050dc12.svg)，当d轴对准A相（![](https://cdn.nlark.com/yuque/__latex/cc2d071959cad893968819e1787c81a0.svg)），![](https://cdn.nlark.com/yuque/__latex/c8b7765bfc63d6954482646e6688d982.svg)；当q轴对准A相（![](https://cdn.nlark.com/yuque/__latex/7eb68f423484adc3ee76b451129a6a21.svg)），![](https://cdn.nlark.com/yuque/__latex/af0e6b7e0f96afc771247997a918dde9.svg)，完全符合物理实际。

---

## 四、补充：B/C相自感、相间互感的项来源

你之前看到的B、C相自感，以及AB/BC/CA相间互感的![](https://cdn.nlark.com/yuque/__latex/d5b92e1b4bf117e6435748c26edcb171.svg)表达式，推导逻辑和A相自感完全一致：

1. B相自感：将绕组函数替换为![](https://cdn.nlark.com/yuque/__latex/2fe22ae612dc1b028dd22ea982fd3812.svg)，代入积分后，最终得到![](https://cdn.nlark.com/yuque/__latex/645fde5a2b64d85c0864b4573d1fe873.svg)项；
2. 相间互感![](https://cdn.nlark.com/yuque/__latex/1f7ebf29d96187d54452837a79aebe82.svg)：用互感公式![](https://cdn.nlark.com/yuque/__latex/b69ce589a632b6132acb625e3c7e5fb8.svg)，绕组函数相乘后展开，积分后得到![](https://cdn.nlark.com/yuque/__latex/d21863dff178457f9ccc8bbd6bbfc67d.svg)项，和你之前看到的表达式完全匹配。

---

## 五、核心总结

1. ![](https://cdn.nlark.com/yuque/__latex/0cadd919ddf82eab032a682f57e34aae.svg)、![](https://cdn.nlark.com/yuque/__latex/7b1556b5b4422dce6093a6d6d3a8eb66.svg)的本质：**定子电感拆分为与转子无关的漏感，和由d/q轴磁路决定的主电感**，漏感d/q轴通用，主电感因凸极效应出现差异；
2. 自感中![](https://cdn.nlark.com/yuque/__latex/cb82c6b15d27639e92b23a5e37b03ca2.svg)项的本质：**凸极电机的气隙磁导随转子位置呈2倍电角度周期变化**，通过绕组函数与磁导的积分，最终仅保留恒定项和2倍频余弦项，其余项全部归零；
3. 所有公式的底层逻辑：电感与磁导成正比，磁导由磁路决定，凸极结构导致磁导随转子位置周期性变化，最终体现为ABC坐标系下电感随![](https://cdn.nlark.com/yuque/__latex/3ef0f4beff17eb0426a7430c8be423d0.svg)变化，而dq坐标系下电感解耦为恒定值。