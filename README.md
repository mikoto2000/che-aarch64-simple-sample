# Eclipse Che と Xilinx/qemu による Aarch64 開発体験サンプル

`che.openshift.io` 上に `aarch64-linux-gnu` と `Xilinx/qemu` の環境を構築します。

## 事前準備

`che.openshift.io` へのユーザー登録をしていない場合には、[Registering to Hosted Che](https://www.eclipse.org/che/docs/che-7/hosted-che/#registering-to-hosted-che_hosted-che) を参照してユーザー登録を行う。

## 体験手順

`che.openshift.io` の、外から devfile を差し込む機能を使って、カスタムワークスペースを構築する。

使用する devfile は以下。

https://gist.githubusercontent.com/mikoto2000/7a58e2130ec17b2cca17d9aee4257b73/raw/7bb067a8998e90fb4b9cacf861477d33280182ce/che-aarch64-simple-sample.yaml

### `che.openshift.io` にワークスペースを作成する

`che.openshift.io` へログインした後、以下の URL に接続する。

https://che.openshift.io/f?url=https://gist.githubusercontent.com/mikoto2000/7a58e2130ec17b2cca17d9aee4257b73/raw/7bb067a8998e90fb4b9cacf861477d33280182ce/che-aarch64-simple-sample.yaml

`url=xxx` で指定した `xxx` を devfile として読み込んで、 `che.openshift.io` 上に環境を構築してくれる。
(`che.openshift.io` のサーバーから見える場所に置く必要がある)


### ワークスペースを開いてからの操作

1. ビルド
    1. メニューを `Terminal` -> `Open Terminal in specific container` -> `gcc-aarch64-linux-gnu` と選択していく
    2. 開いたターミナルで `cd simple-sample; make`
2. QEMU 起動
    1. メニューを `Terminal` -> `Open Terminal in specific container` -> `qemu-xilinx` と選択していく
    2. 開いたターミナルで `cd simple-sample; make qemu`
        - QEMU が起動し、 GDB 接続待ち状態になる(Makefile 参照)
3. デバッグ
    1. メニューを `Terminal` -> `Open Terminal in specific container` -> `qemu-xilinx` と選択していく
    2. 開いたターミナルで `cd simple-sample; make debug`
       - なぜか `n` -> `Ctrl+c` で `SIGINT` を発生させないとハングアップする...
       - `n` -> `Ctrl+c` した後はいつも通りの gdb 操作ができる

## スタック構築に使用した Docker イメージ

- https://hub.docker.com/r/mikoto2000/che-gcc-aarch64-linux-gnu
- https://hub.docker.com/r/mikoto2000/che-qemu-xilinx
