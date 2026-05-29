# ⚡ FOC 电机控制笔记

> 永磁同步电机（PMSM）磁场定向控制（FOC）学习知识库 · Dataview 仪表盘

---

## 📊 知识库概览

```dataview
TABLE length(rows) AS 数值
WHERE file.name != "README"
GROUP BY "📄 笔记总数"
```

### 各目录分布

```dataview
TABLE length(rows) AS 笔记数
WHERE file.folder != "/" AND !contains(file.folder, ".reasonix")
GROUP BY file.folder
SORT length(rows) DESC
```

---

## 🔄 最近更新

```dataview
TABLE title AS 标题, file.mtime AS 修改时间
WHERE (
  contains(file.path, "FOC") OR
  contains(file.path, "转子磁场定向") OR
  contains(file.path, "课本")
)
SORT file.mtime DESC
LIMIT 10
```

---

## 🧲 磁链专题

```dataview
TABLE title AS 标题, file.cday AS 创建日期
FROM "FOC/磁链--最最简单的理解"
SORT file.name ASC
```

### 常见疑问

```dataview
LIST title
FROM "FOC/答疑"
SORT file.name ASC
```

---

## ⚡ 电感专题

```dataview
TABLE title AS 标题, file.mtime AS 修改时间
FROM "FOC/电感"
SORT file.name ASC
```

---

## 🔢 常用公式与推导

```dataview
TABLE title AS 标题
FROM "FOC/常用公式"
SORT file.name ASC
```

---

## 🔄 调制专题

```dataview
TABLE title AS 标题
FROM "FOC/调制"
SORT file.name ASC
```

---

## 🎯 角度解算

```dataview
TABLE title AS 标题
FROM "FOC/角度解算"
SORT file.name ASC
```

---

## 🔍 无感控制

```dataview
TABLE title AS 标题
FROM "FOC/无感"
SORT file.name ASC
```

---

## 📊 其他 FOC 专题

```dataview
TABLE title AS 标题
FROM "FOC"
WHERE (
  contains(file.folder, "母线电流") OR
  contains(file.folder, "滤波器") OR
  contains(file.folder, "谐波")
)
SORT file.name ASC
```

---

## 📚 课本笔记

```dataview
TABLE title AS 标题, file.mtime AS 修改时间
FROM "课本"
SORT file.folder ASC, file.name ASC
```

---

## 📋 学习管理

- [[待办清单]] — 待办事项与进度追踪
- [[FOC/问题&资料收集]] — 未解决的问题与收集的资料

---

> 💡 **提示**：所有表格都是由 Dataview 自动生成的，新建或修改笔记后刷新即可更新。
>
> *最后更新: 2026-05*
