# proccesingを使って明度情報から音の出力

## 環境
Mac book pro：OSX El Capitan(10.11.6)
Processing：3.2.3
公式ライブラリ
- video：画面キャプチャするためのライブラリ
- minim：音の出力・生成のライブラリ


## ライブラリのインストール
Processingを起動させて、
> スケッチ -> ライブラリをインポート -> ライブラリの追加

から Contribution Manager を開く。

<img src="https://qiita-image-store.s3.amazonaws.com/0/111944/33fab827-fd9e-d737-59fc-0e02df8e1713.png" width="75%">

---
|ライブラリ名|説明|画像|
|---|---|---|
|Video|macの内蔵カメラを起動させてキャプチャするためのライブラリ|<img src="https://qiita-image-store.s3.amazonaws.com/0/111944/0b651a4e-7a0a-6be7-db40-030209a7cdb9.png">|
|Minim|サイン波から音を生成させて出力するためのライブラリ|<img src="https://qiita-image-store.s3.amazonaws.com/0/111944/082d4e97-e64f-dfdc-ea4f-a369f84829b6.png">|


## コードのダウンロード
[github](https://github.com/shiiiiiiiii1/capture_sound)にコードをまとめておいたのでそこからダウンロードをする。
緑の`clone or download`から`Download ZIP`をする。
<img src="https://qiita-image-store.s3.amazonaws.com/0/111944/c3cfc61e-228a-97c2-b439-08db85bf638d.png" width="80%">


## 大まかなコードの流れ
1. 音と画面の大きさの設定とかキャプチャするためのカメラのセットアップ。
2. 起動できるカメラがあったら、起動して表示させる。
3. １ピクセルごとの色（R, G, B）を検出して、モノクロに変換する。
4. モノクロに変換した値の平均を求める。
5. Sin派のヘルツの値をモノクロの平均した値に置き換えて出力する。


## 参考
http://detail.chiebukuro.yahoo.co.jp/qa/question_detail/q13116954278
http://r-dimension.xsrv.jp/classes_j/image_processing1/
http://wiki.bmoon.jp/wiki.cgi/Programming?page=%B2%BB%A4%F2%BB%C8%A4%A6