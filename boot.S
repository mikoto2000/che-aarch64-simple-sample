// ブート時のエントリーポイント
.global start
start:
    // スタックポインタの開始位置指定
    mov sp, #0x80000

    // 何もせず無限ループ
    b halt

// 無限ループ
halt:
    wfe
    b halt

