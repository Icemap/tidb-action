# TiDB Action

[English](/README.md) | 中文

## 说明

- 这是一个非官方的 [GitHub Action](https://github.com/features/actions), 使用 Docker 部署一个 TiDB。
- 这个 Action 仅用于测试，如果你希望部署一个 TiDB 集群，请看[这里](https://docs.pingcap.com/zh/tidb/stable/production-deployment-using-tiup)。
- 这个库基于 [mirromutth/mysql-action](https://github.com/mirromutth/mysql-action) 开发。

## 使用方法

最简配置：

```yaml
steps:
- uses: Icemap/tidb-action@v1.1
```

全部配置：

```yaml
steps:
- uses: Icemap/tidb-action@v1.1
  with:
    port: 4001 # 可选，默认为 4000，TiDB 将要运行的端口
    version: "v7.1.0" # 可选，默认为 v7.1.0，TiDB 运行的版本
    config: |
[tikv-client.async-commit]
safe-window = 0
allowed-clock-drift = 0 # 可选，默认为空，在你需要特别的 TiDB 配置时，可将配置写在这里
    inner port: 4001 # 可选，默认为 4000，指 TiDB 容器内部的映射位置，这是在你更改了配置中的 port 时才会用到的一个配置
```
