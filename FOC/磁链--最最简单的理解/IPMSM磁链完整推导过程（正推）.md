---
title: IPMSM磁链完整推导过程（正推）
slug: gwg1lzhq0v4h1ppx
created: 2026-03-25T02:45:17.000Z
updated: 2026-04-13T09:06:06.000Z
---

## 一、推导前提与核心约定

### 1. 理想电机标准假设

- 定子三相绕组对称，空间互差120°电角度，星形连接无中性线；
- 气隙磁场沿空间正弦分布，忽略齿槽效应、磁路饱和、铁芯损耗与绕组高次谐波；
- 永磁体退磁曲线线性，励磁磁链幅值恒定，无温度漂移影响；
- 转子电角度![](https://cdn.nlark.com/yuque/__latex/d0427b08999fd3b56586dac53a94cfb3.svg)：转子d轴（永磁体N极轴线）与定子α轴（A相绕组轴线）的夹角，转子电角速度![](https://cdn.nlark.com/yuque/__latex/8628889bd6ae3201d59892144a8746fb.svg)，d-q轴随转子同步旋转。

### 2. 核心参数定义

- ![](https://cdn.nlark.com/yuque/__latex/57fb2312b1817199e91ba0c31525d358.svg)：定子每相绕组漏感（与转子位置无关的恒定值）
- ![](https://cdn.nlark.com/yuque/__latex/132064dba5e5fe1d5cd4a37570d58693.svg)：d轴电枢反应电感（直轴主电感，对应d轴气隙磁路）
- ![](https://cdn.nlark.com/yuque/__latex/3abbe28cc704eef3ac36183fb7c3c3bc.svg)：q轴电枢反应电感（交轴主电感，对应q轴气隙磁路）
- ![](https://cdn.nlark.com/yuque/__latex/c53214b06ca7ea1cb0b2326397106976.svg)：d轴同步电感（直轴总电感）
- ![](https://cdn.nlark.com/yuque/__latex/32aabc4d7558b10b8b58bb7682ffdd31.svg)：q轴同步电感（交轴总电感）
- ![](https://cdn.nlark.com/yuque/__latex/ffc7d77559a76cccc1ebbb2c68e9dd0c.svg)：永磁体在定子绕组中产生的励磁磁链幅值（恒定常数）
- ![](https://cdn.nlark.com/yuque/__latex/f41cf3ee91a2162854dc8499e4c8f27d.svg)：电机极对数

---

## 二、第一步：ABC三相坐标系下的磁链原始方程（物理本质）

定子三相绕组的全磁链，由**定子电流产生的电枢反应磁链**和**永磁体在定子绕组中感应的励磁磁链**两部分组成，是所有推导的物理基础：

![](https://cdn.nlark.com/yuque/__latex/67b7ccadb231ed297a83cc0738b33572.svg)

### 1. 永磁体励磁磁链的三相分量

永磁体磁链幅值恒定为![](https://cdn.nlark.com/yuque/__latex/ffc7d77559a76cccc1ebbb2c68e9dd0c.svg)，方向随转子同步旋转，在三相绕组上的投影为空间互差120°的余弦函数：

![](https://cdn.nlark.com/yuque/__latex/eda0b0cbea9082e8f7142554a4c95157.svg)

### 2. 定子电感矩阵（IPMSM凸极效应的核心体现）

IPMSM永磁体嵌入转子铁芯内部，d轴磁路经过永磁体（磁导率接近空气，磁阻大），q轴磁路为铁芯（磁阻小），存在强烈的凸极效应。这导致定子绕组的自感、互感**随转子位置**![](https://cdn.nlark.com/yuque/__latex/d0427b08999fd3b56586dac53a94cfb3.svg)**以2倍电频率周期性变化**，电感矩阵为：

![](https://cdn.nlark.com/yuque/__latex/c322a8a193915df2b0d78da56f07d87d.svg)

其中核心分量为：

- 自感（每相绕组总自感）：

![](https://cdn.nlark.com/yuque/__latex/7a32f1fef75e2249096ccc415acef18a.svg)

- 互感（两相绕组间的互感）：

![](https://cdn.nlark.com/yuque/__latex/de74bcd5bf6e491a07be3f2716d6c1ec.svg)

关键参数定义：

- 平均主电感：![](https://cdn.nlark.com/yuque/__latex/f45904a5dca45f42de7bbf66ed2a4cdd.svg)
- 2次谐波电感（凸极效应项）：![](https://cdn.nlark.com/yuque/__latex/5cc1531445787b58380f75ffba9c7926.svg)
- IPMSM的![](https://cdn.nlark.com/yuque/__latex/7915b9d56c7adcf23d37222c7686e6b3.svg)，因此![](https://cdn.nlark.com/yuque/__latex/12ea5d8dd1e9b2b63ca602dd183dde08.svg)为负数，这是凸极效应的直接数学表达。

这里暂时不考虑磁链表达式里的电感矩阵是怎么得到的，在后面的电感内容会具体讲解

---

## 三、第二步：α-β静止坐标系下的磁链原始推导

对式(1)左右两侧同时左乘Clark变换矩阵![](https://cdn.nlark.com/yuque/__latex/925559039cd53878860a1209b7cd284b.svg)，得到α-β坐标系下的磁链方程：

![](https://cdn.nlark.com/yuque/__latex/719c7bfa3cc1edbb43aa77e6d8aeaa2e.svg)

（其中![](https://cdn.nlark.com/yuque/__latex/617fa7b379731f9cb32be5bc26eb5abe.svg)为Clark逆变换）

### 1. 永磁体励磁磁链的α-β分量

将式(2)代入Clark变换，利用三角函数正交性化简，最终得到：

![](https://cdn.nlark.com/yuque/__latex/b1bf76fb0ece7fb6d05d48c238534097.svg)

该部分与表贴式电机（SPMSM）完全一致，仅与转子位置有关，与凸极效应无关。

### 2. 电枢反应磁链的α-β分量（凸极效应的核心问题）

对电感矩阵做Clark变换![](https://cdn.nlark.com/yuque/__latex/1994798d5f6cdeb42f24ca1cb3fada5d.svg)，经过矩阵乘法和三角函数化简，最终得到：

![](https://cdn.nlark.com/yuque/__latex/939c5769098b132ce5dcb4d8ec38c8f3.svg)

### 3. α-β坐标系下的磁链原始方程

将式(5)(6)代入式(4)，得到IPMSM在α-β坐标系下的完整磁链方程：

![](https://cdn.nlark.com/yuque/__latex/b6dd82c5b750ad5af044465a51e0f4d3.svg)

**这个磁链的表达式和反推 αβ 磁链文章里面最后得到的结果是一致的，到这里说明完成了 αβ 轴下磁链的正反推数学推导，并得到了互相验证。**

### 关键结论

IPMSM在α-β坐标系下的磁链方程，存在**2倍频时变电感项**和**交叉耦合项**，α轴电流会影响β轴磁链，反之亦然，方程复杂度极高，工程实用性极低。**仅当**![](https://cdn.nlark.com/yuque/__latex/480a86444de8e00ca82e6f199b9b53f3.svg)**（SPMSM）时，时变项和交叉项全部消失，退化为SPMSM的简洁磁链方程。**

---

## 四、第三步：d-q同步旋转坐标系下的IPMSM磁链方程（核心解耦形式）

d-q坐标系与转子凸极结构相对静止，是IPMSM建模的最优坐标系，可完全消除时变项和交叉耦合。对α-β磁链方程左乘Park变换矩阵![](https://cdn.nlark.com/yuque/__latex/6fb4058f71b99f6aa4656dbe7c08c2df.svg)，得到：

![](https://cdn.nlark.com/yuque/__latex/99989462e96174a0e871682d5480e381.svg)

电流的Park变换关系为：

![](https://cdn.nlark.com/yuque/__latex/b0ad495a31676b0db3089185a63d292f.svg)

### 1. 永磁体励磁磁链的d-q分量

将式(5)代入Park变换，展开计算：

![](https://cdn.nlark.com/yuque/__latex/f8b5c3dfe0f522db7f71f882b01b7725.svg)

利用![](https://cdn.nlark.com/yuque/__latex/52878b8e5b68fe65164248422bc47f20.svg)化简，得到：

![](https://cdn.nlark.com/yuque/__latex/fa2fee32e2cdc7c19b8d1ff5779c6b3a.svg)

永磁体励磁磁链仅在d轴存在恒定分量，q轴分量为0，与转子位置完全无关。

### 2. 电枢反应磁链的d-q分量

对α-β电感矩阵做Park变换![](https://cdn.nlark.com/yuque/__latex/0211c0aaa205a34f3d769b7da99eda44.svg)，代入式(6)的电感矩阵，经过三角函数化简后，**时变项和交叉耦合项全部抵消**，最终得到对角恒定的电感矩阵：

![](https://cdn.nlark.com/yuque/__latex/24a8d581be85ee5334a0939e86412326.svg)

### 3. d-q坐标系下IPMSM磁链最终方程

将电枢反应磁链和永磁体磁链合并，得到IPMSM最核心、工程通用的磁链方程：

![](https://cdn.nlark.com/yuque/__latex/a204df093f36e5361c4c1cd9367c2882.svg)

### 核心优势

1. **完全解耦**：d轴与q轴磁链相互独立，无交叉耦合，d轴电流不影响q轴磁链，反之亦然；
2. **定常参数**：![](https://cdn.nlark.com/yuque/__latex/37cb0f04ee7c8f9b709a48f0a3ec252f.svg)、![](https://cdn.nlark.com/yuque/__latex/92f16a7f1fbdc9cb4103716794c3128f.svg)、![](https://cdn.nlark.com/yuque/__latex/ffc7d77559a76cccc1ebbb2c68e9dd0c.svg)均为恒定常数，与转子位置![](https://cdn.nlark.com/yuque/__latex/d0427b08999fd3b56586dac53a94cfb3.svg)完全无关；
3. **物理意义清晰**：

- ![](https://cdn.nlark.com/yuque/__latex/ebbf55e5bc025c226963c7172361f0de.svg)：d轴总磁链 = d轴电流电枢反应磁链 + 永磁体励磁磁链；
- ![](https://cdn.nlark.com/yuque/__latex/adfa246ad14e198868a5edbb8ff8aa0a.svg)：q轴总磁链 = q轴电流电枢反应磁链，q轴无永磁体磁链。

---

## 五、第四步：从d-q轴反推α-β坐标系下的IPMSM磁链方程（工程标准方法）

工程上均采用此方法推导α-β磁链，过程规范、零出错，完全规避了直接推导的复杂时变电感矩阵。

### 1. 基础变换关系

Park逆变换的核心定义为：

![](https://cdn.nlark.com/yuque/__latex/47a6883dc211940ab792f2773eff3dab.svg)

### 2. 代入d-q磁链方程得到中间形式

将式(12)的![](https://cdn.nlark.com/yuque/__latex/ebbf55e5bc025c226963c7172361f0de.svg)、![](https://cdn.nlark.com/yuque/__latex/adfa246ad14e198868a5edbb8ff8aa0a.svg)代入式(13)，直接得到IPMSM的α-β磁链中间形式（工程磁链观测器通用）：

![](https://cdn.nlark.com/yuque/__latex/17b463227e1eff72e40869b7fb82046d.svg)

### 3. 展开为仅含α-β电流的最终形式

将dq轴电流与α-β电流的变换关系（Park逆变换）：

![](https://cdn.nlark.com/yuque/__latex/76ae9432b7b2132752453eeecc441abd.svg)

代入式(14)，展开并利用三角恒等式化简，最终得到的结果，与直接从ABC坐标系推导的式(7)**完全一致**，验证了推导的正确性。

---

## 最终总结

1. IPMSM磁链的核心是**d-q坐标系下的解耦磁链方程**![](https://cdn.nlark.com/yuque/__latex/84d60f8311f2945a66523048f967c44f.svg)，它天然适配IPMSM的凸极结构，消除了时变项与交叉耦合；
2. α-β坐标系下的磁链方程理论上可直接推导，但形式复杂、时变耦合，工程上无实用性；
3. 从d-q轴反推α-β磁链，是工程最优解，过程规范、计算简洁，结果与直接推导完全一致，是IPMSM磁链建模的标准方法。