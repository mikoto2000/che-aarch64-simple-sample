# Xilinx/qemu による Aarch64 開発体験サンプル

## 体験手順

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
       
       
