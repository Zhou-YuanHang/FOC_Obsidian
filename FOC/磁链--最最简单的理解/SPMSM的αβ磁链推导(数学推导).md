---
title: SPMSM的αβ磁链推导(数学推导)
slug: uu3snv2n55lk0kh0
created: 2026-03-31T18:25:18.000Z
updated: 2026-04-18T09:13:05.000Z
---

## 一、核心前提与理想假设

推导前先明确SPMSM的结构特性与理想约束，保证推导的严谨性与工程适用性：

1. **结构核心特性**：SPMSM永磁体贴于转子表面，永磁体相对磁导率≈1（与空气接近），电机气隙均匀，**d轴与q轴主磁路磁阻完全相等**，这是SPMSM区别于IPMSM（内置式）的核心，最终决定了![](https://cdn.nlark.com/yuque/__latex/480a86444de8e00ca82e6f199b9b53f3.svg)。
2. **理想电机假设**

- 定子三相绕组完全对称，空间上互差120°电角度，绕组匝数、参数一致；
- 忽略铁芯磁饱和、磁滞损耗与涡流损耗，磁路线性，满足叠加原理；
- 气隙磁场呈正弦分布，忽略齿槽效应与空间谐波；
- 永磁体无阻尼作用，转子无阻尼绕组；
- 三相电流对称，满足![](https://cdn.nlark.com/yuque/__latex/e3fcb53af055f93b525534921ab5fa8c.svg)。

## 二、步骤1：ABC三相静止坐标系下的磁链方程

### 3.1 定子绕组的电感特性

SPMSM气隙均匀，因此三相绕组的自感、互感均为恒定值，不随转子位置![](https://cdn.nlark.com/yuque/__latex/3ef0f4beff17eb0426a7430c8be423d0.svg)变化：

上面的结论会在电感的解释中给出具体推导过程，这里直接记住即可

- 自感：三相绕组对称，自感相等，![](https://cdn.nlark.com/yuque/__latex/9b24004e1eabf99c738802cc8409b21a.svg)（漏感+主电感）；
- 互感：三相绕组空间互差120°，互感幅值相等且为负值，![](https://cdn.nlark.com/yuque/__latex/7ef28dbf698f2e9368d61a0ecbd4c46e.svg)（由磁路耦合的余弦特性，![](https://cdn.nlark.com/yuque/__latex/2ceb3781245fc087f2d11bebe81c3078.svg)）。

### 3.2 永磁体的三相磁链分量

永磁体磁场正弦分布，其在三相绕组中感应的磁链与转子位置![](https://cdn.nlark.com/yuque/__latex/3ef0f4beff17eb0426a7430c8be423d0.svg)呈余弦关系：

![](https://cdn.nlark.com/yuque/__latex/d108734464f7de10c309c5d1a97e144f.svg)

### 3.3 三相磁链方程

每相总磁链 = 自感磁链 + 互感磁链 + 永磁磁链，矩阵形式为：

![](https://cdn.nlark.com/yuque/__latex/a3891bd10ec0014326fda2542d9e91ed.svg)

代入电感参数与三相电流平衡条件![](https://cdn.nlark.com/yuque/__latex/e3fcb53af055f93b525534921ab5fa8c.svg)，对单相等效化简（以A相为例）：

![](https://cdn.nlark.com/yuque/__latex/c0169810766ac1f61d49c6e47349be33.svg)

B、C相可同理化简，三相方程形式完全对称。

---

## 四、步骤2：Clark变换→αβ两相静止坐标系磁链方程

通过**等幅值Clark变换**解耦为两相正交静止坐标系，变换矩阵为：

![](https://cdn.nlark.com/yuque/__latex/18057e29fece51e5194002a972225592.svg)

逆变换为其转置矩阵![](https://cdn.nlark.com/yuque/__latex/2e181d3e2a74cf21d8d0d2a70806f589.svg)，满足![](https://cdn.nlark.com/yuque/__latex/fa91e4a88dacb3bb55672467be2101e3.svg)，![](https://cdn.nlark.com/yuque/__latex/248e82bf8dd9fdb4403bd7a4ad824bf5.svg)。

### 4.1 电感矩阵的变换

将三相电感矩阵代入变换，因SPMSM气隙均匀，变换后αβ轴电感完全相等，且为恒定值：

![](https://cdn.nlark.com/yuque/__latex/8db6c3a8ea3c03b5e4761c1969bd1831.svg)

![](https://cdn.nlark.com/yuque/__latex/2ee8fd0432b23b4c1852226e6dac95b5.svg)为两相坐标系下的定子等效电感。

### 4.2 永磁磁链的αβ分量

将三相永磁磁链代入Clark变换，通过三角恒等式化简：

![](https://cdn.nlark.com/yuque/__latex/8d3ffe5cb67a4c5e4c8aed11ae14367e.svg)

### 4.3 αβ坐标系磁链方程

最终得到解耦后的两相静止坐标系磁链方程：

![](https://cdn.nlark.com/yuque/__latex/9473559f737e07c5e23511deb434e629.svg)

这里额外交代一下推导的过程注意点：

1、在推 4.3 下面的公式的时候，按照上面的推导逻辑，等式左边左乘上一个![](https://cdn.nlark.com/yuque/__latex/925559039cd53878860a1209b7cd284b.svg)的变换阵，那么等式右边肯定也要左乘一个同样的变换阵

2、等号右边左乘完后，表达式是：

![](https://cdn.nlark.com/yuque/__latex/04095df8030d65fa47d4cb046cdaee46.svg)

3、左边前三项就是 αβ 轴下的电感表达式

4、前面说了![](https://cdn.nlark.com/yuque/__latex/2ee8fd0432b23b4c1852226e6dac95b5.svg)相当于一个公因数，是可以挪到最左边的

---

## 五、步骤3：Park变换→dq同步旋转坐标系磁链方程

αβ坐标系仍随转子位置变化，通过**等幅值Park变换**转换为与转子同步旋转的dq坐标系（d轴与永磁体N极轴线重合，q轴超前d轴90°电角度），实现磁链的完全稳态解耦。

Park变换矩阵为：

![](https://cdn.nlark.com/yuque/__latex/5600091776a4b1477967c859ec9d6914.svg)

逆变换为其转置矩阵![](https://cdn.nlark.com/yuque/__latex/a8f7242f97e16fe526bfb626ca638703.svg)，满足![](https://cdn.nlark.com/yuque/__latex/6a314fd7579e59697d3943810c2af9da.svg)，![](https://cdn.nlark.com/yuque/__latex/28d004c563b20d501798f130e371b80c.svg)。

### 5.1 直轴磁链推导

![](https://cdn.nlark.com/yuque/__latex/a295b0be0cdde35bb7bccaeca9f7b84c.svg)

上面的公式使用的是投影的思想，使用坐标变换一样可以得到这个结果。

电感输入二阶张量，连接的是磁链和电流这两个一维向量，所以磁链在使用坐标变换的时候，除了左乘![](https://cdn.nlark.com/yuque/__latex/6fb4058f71b99f6aa4656dbe7c08c2df.svg)还需要右乘![](https://cdn.nlark.com/yuque/__latex/a8f7242f97e16fe526bfb626ca638703.svg)

根据Park变换定义，![](https://cdn.nlark.com/yuque/__latex/56b65f38a7df21e850da832ace4e5718.svg)，且![](https://cdn.nlark.com/yuque/__latex/6c69b1b8d52553ac42e4d771c8b24540.svg)，因此：

![](https://cdn.nlark.com/yuque/__latex/18d14875496e5d9a3b53892401276a6f.svg)

其中![](https://cdn.nlark.com/yuque/__latex/1196ce3224f4ed7b47aea3fe153e0193.svg)，为d轴同步电感。

### 5.2 交轴磁链推导

![](https://cdn.nlark.com/yuque/__latex/2fde16d069b93918a8a017541a3d6e16.svg)

永磁磁链项相互抵消为0，且根据Park变换定义![](https://cdn.nlark.com/yuque/__latex/314ca87193f000743e7c34886ac7b57e.svg)，因此：

![](https://cdn.nlark.com/yuque/__latex/647c6b4d6de81c382712328e7aeced82.svg)

其中![](https://cdn.nlark.com/yuque/__latex/5516e84e8340b1783e2c21310ae46b62.svg)，为q轴同步电感。

---

## 六、最终SPMSM磁链方程与核心结论

### 6.1 dq坐标系下的标准磁链方程（工程最常用）

![](https://cdn.nlark.com/yuque/__latex/dd01d876b6251fb5f6ac0dda176f2afa.svg)

### 6.2 核心特性结论

1. **SPMSM的核心标识**：因气隙均匀，**直轴与交轴同步电感相等，即**![](https://cdn.nlark.com/yuque/__latex/26a0b96ddd83f547c8e27d46a2e70967.svg)，这是与IPMSM（![](https://cdn.nlark.com/yuque/__latex/dc4b1f6fe7ea2929782bd0b9b6a3680e.svg)）最本质的区别；
2. 永磁体仅在d轴产生恒定励磁磁链![](https://cdn.nlark.com/yuque/__latex/ffc7d77559a76cccc1ebbb2c68e9dd0c.svg)，q轴无永磁磁链分量，实现了稳态下的完全解耦；
3. 若采用等功率Clark/Park变换，仅电感数值系数变化，![](https://cdn.nlark.com/yuque/__latex/480a86444de8e00ca82e6f199b9b53f3.svg)的核心关系与磁链方程形式完全不变。

# 代码

```
clear; clc; close all;

%% 1. 定义符号变量
% 电机参数符号
syms L_sigma L_mf real;          % L_sigma: 定子漏电感, L_mf: 励磁等效电感
% 转子位置角符号
syms theta_r real;                % theta_r: 转子d轴与定子A轴的电角度

%% 2. 定义坐标变换矩阵（功率不变型）
% Clarke变换矩阵 (ABC -> αβ0)
T_clarke = 2/3 * [
    1,    -1/2,        -1/2;
    0,  sqrt(3)/2,  -sqrt(3)/2;
    1/sqrt(2), 1/sqrt(2), 1/sqrt(2)
];

% Park变换矩阵 (αβ0 -> dq0)
T_park = [
    cos(theta_r),  sin(theta_r), 0;
    -sin(theta_r), cos(theta_r), 0;
    0,             0,            1
];

% 总变换矩阵 (ABC -> dq0)
T_abc2dq0 = T_park * T_clarke;

%% 3. 定义ABC坐标系电感矩阵（题目给定形式）
% 三相自感
L_aa = L_sigma + L_mf;
L_bb = L_aa;
L_cc = L_aa;

% 三相互感
L_ab = -1/2 * L_mf;
L_ac = L_ab;
L_ba = L_ab;
L_bc = L_ab;
L_ca = L_ab;
L_cb = L_ab;

% 构建ABC电感矩阵
L_abc = [
    L_aa, L_ab, L_ac;
    L_ba, L_bb, L_bc;
    L_ca, L_cb, L_cc
];

%% 4. 推导 αβ0 坐标系电感矩阵
% 公式：L_αβ0 = T_clarke * L_abc * T_clarke^T
% （功率不变型变换为正交矩阵，逆矩阵等于转置）
L_alphabeta0 = T_clarke * L_abc * T_clarke.';
L_alphabeta0 = simplify(L_alphabeta0); % 化简结果

%% 5. 推导 dq0 坐标系电感矩阵
% 公式：L_dq0 = T_park * L_αβ0 * T_park^T
L_dq0 = T_park * L_alphabeta0 * T_park.';
L_dq0 = simplify(L_dq0); % 化简结果

%% 6. 输出推导结果
fprintf('==============================================\n');
fprintf('  表贴式永磁同步电机电感矩阵 通用公式推导结果\n');
fprintf('==============================================\n');

fprintf('\n--- 1. ABC坐标系电感矩阵 L_abc ---\n');
pretty(L_abc);

fprintf('\n--- 2. αβ0坐标系电感矩阵 L_αβ0 (已化简) ---\n');
pretty(L_alphabeta0);

fprintf('\n--- 3. dq0坐标系电感矩阵 L_dq0 (最终结果，已化简) ---\n');
pretty(L_dq0);

fprintf('\n==============================================\n');
fprintf('核心结论：SPMSM中 L_d = L_q = L_sigma + L_mf\n');
fprintf('==============================================\n');
```