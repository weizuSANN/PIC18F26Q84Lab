
## 始め方
まず何らかの手段で17800円した書き込み機を入手しましょう。その後、何らかの手段（学生メアドがある人は[サンプル請求](https://www.microchipdirect.com/samples?Devicefamily=PIC18F26Q84) をすると2週とか1ヶ月に2種類のICを3～5個くらい手に入るぞ！）PICマイコンを入手します。

今日日VSCode MPLAB Extensionの導入に手間取ることはないと思うので適当に導入してください。

インストールが終わったら、Ctrl+Shift+Pで``` MPLAB Create New Project ```とか入力して、プロジェクトを作成しましょう。

![MPLAB Create New Project](Picture/1_Create.png)

プロジェクト名を要求されるので、適当に。かっこいい名前を！

![Project Name](Picture/2_Name.png)

次に聞かれるのは保存先です。Defaultでいいでしょう。

![Project Location](Picture/3_Location.png)

さてマイコンの型番の選択です。本プロジェクトはPIC18F26Q84について取り扱うのでPIC18F26Q84を選択しますがそれ以外なら別な型番を入力しましょう。PIC32って普通に値段以外STMの劣化だと思ってるんですけどなんかうれしいんですかね？

![Select MCU](Picture/4_SelectMCU.png)

プロジェクトタイプの選択ですが、普通にApplication何たらを選びましょう。それ以外に選ぶ理由がない。

![Application Standard](Picture/5_AppStandard.png)

コンパイラは可能ならXC何たらを選びましょう。理由はなんとなく。名前かっこいいし。

![Select Compiler](Picture/6_SelectCompiler.png)

するとあら不思議。プロジェクトの出来上がりです。

## MCCとかいろいろと

なぜか一部の界隈で忌避されがちなMCCです。ぶっちゃけこれ使わなかったら地獄の苦しみを味わうので、これはあること前提です。

STMでいうところのCubeMXです。なぜかレジスタオンリーを強要する組織もあるらしいですが普通に使いましょう。MCCアンチ活動するから界隈の人口が減るのでは…？

話戻してMCCの使い方。

Ctrl+Shift+Pで``` MPLAB MCC ```と検索して、Launchって書いてあるのを選択。

![MPLAB MCC Launch](Picture/7_Launch.png)

英語は読めませんがたぶん初回起動時なのでMCCの初期設定を作成するみたいなことが書いてあるんでしょう。

![Create MCC](Picture/8_CreateMCC.png)

そのあとプロジェクトを選択させられます。MPLAB Projectでいいんじゃないですか？

![Select Project](Picture/9_SelectProject.png)

読めませんがProceedって書いてあるのでこれを選ぶ。

![Proceed](Picture/10_Proceed.png)

さあMCCの画面です。ここから地獄を見ましょう。

![MCC Screen](Picture/11_MCC.png)

ひとまずサイドのProject Resourcesを開いてください。Generateのボタンがありますよね？つまりそういうことです。これを押すことで基本ファイルを生成できます。とりあえず確認した限りだと初期状態でGenerate押してもさしてひどい状態にはならないようなので、一旦Generateしちゃいましょうね。

![Generate Button](Picture/12_Generate.png)

するとmain.cが消滅するので、どこにあるかというと、（プロジェクトフォルダ）/config.mcc/main.c にあります。まあとりあえずこれでコードは書けますね。

## 書き込もうぜ！

MPLAB X IDEユーザーとか言うたぶんこの世に数十名しかいない人々のために先に言っておくと、Set as main projectの必要はありません。フォルダ開いてれば自動認識してくれるからね。

Ctrl+Shift+Pで``` MPLAB clean and build ```を実行して、ビルドが通るか確認。ちなみにビルドが通るかの確認は必要ないです。F5でいい。

![Clean and Build](Picture/13_CleanAndBuild.png)

F5を押すと、ビルド方式が出るので、MPLAB Debbugerみたいなのを選択。

![Select Debugger](Picture/14_Debugger.png)

PICkit5を選ぶと大体書き込まれます。

![Select Tools](Picture/15_SelectTools.png)

何か書き込みできないって？なんでかというと17800円した書き込み機ことPICkitくんは標準でマイコンに対して電源供給しない設定になってるから。

一旦VSCodeサイドバーのMPLAB拡張を開いて、Toolsのところにカーソル合わせると出てくる歯車ボタンを押す。

![PICkit Tools Settings](Picture/16_PICkitSettings.png)

すると、以下のような17800円するPICkit5に対する設定が開くので、設定します。

![PICkit Power Settings](Picture/17_PICkitSettings2.png)

これでもう一度F5したら書き込めます。よかったね。

## ここから先

プログラムを書くために各ペリフェラルの設定をしないといけない。いやだねえ…。STMは初期設定で生成できるのに…。
そのうち書くよ。

### UART
UARTはすべての通信の基本ってはっきりわかんだね。printfで値採れるようにしないと話進まないのでとりあえずUARTで（PCに対して）printfするのを目指す方向にします。

MCCを開いて左サイドバーのDeviceResourceを開きます。Driverのトグルの中に、少しスクロールするとUARTがあるので追加。

UART展開して＋ボタンを押し、Add UARTする。

![MCC Device Resources](Picture/18_MCCDeviceResources.png)

右サイドバーにUARTの設定が表示されるようになるので、設定を変更します。主にBaudrateの変更と、printfのリダイレクト、割り込み有効化とバッファのサイズ変更です。あと、ピンを設定する必要があります。わかりやすくするためにRB4をTX、RB5をRXとしました。ピンの設定は下のグリッドか、パッケージビューでピンのテキストを押すかで設定可能です。

![UART Settings](Picture/19_UARTSettings.png)

これが終わったらGenerate。UART関連のファイルが生成されます。main.cを開いて、``` INTERRUPT_GlobalInterruptEnable(); ```のコメントアウトを解除します。

適当にUARTの配線組んでCH340Eぶっさします。F5押して、VSCode上部に出る再生ボタンをクリック。すると、SerialMonitorにTestと流れ出します。

![UART](Picture/20_UART.png)