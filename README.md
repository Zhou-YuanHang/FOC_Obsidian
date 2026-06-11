---
date created: 2026-06-11 11:05
date updated: 2026-06-11 11:35
---

# FOC 电机控制笔记

## 🔥 学习热力图

```dataview
CALENDAR file.mtime
FROM "FOC" OR "转子磁场定向" OR "课本" OR "待办清单"
```

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

## 📋 待办清单

- 更新 Components-free 插件到模板 OB 库
- 有新增插件

---
