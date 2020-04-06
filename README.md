# JIRA story point input

## About this tool

JIRA 上の Issue にストーリーポイントを入力するツールです。  
（Issue 作成には対応していません。既存の Issue の値を更新します。）

- set_storypoint.rb : 実行用スクリプト
- sample.csv : 入力 CSV のサンプル

## Setting up environment

1. Ruby をインストール  
Ruby 2.3.7 で動作確認しています。
1. Rest Client のインストール  
ターミナル、コマンドプロンプトなどで以下を実行します。  
`$ gem install rest-client`

## How to use this tool

1. my_credential.rb を編集し、自身の JIRA アカウントを設定します。  
UserName : メールアドレス  
Password : API Token ([ここ](https://id.atlassian.com/manage/api-tokens)から取得してください)
1. ツールを実行  
ターミナル、コマンドプロンプトなどで以下を実行します。  
`$ set_storypoint.rb`

## Usage

- `$ set_storypoint.rb `  
Usage を表示します。  
- `$ set_storypoint.rb <issue key> <story point>`  
指定したの Issue のストーリーポイントを設定します。  
ex. `$ set_storypoint.rb Issue-12345 3`  
- `$ set_storypoint.rb <CSVファイル>`  
CSV に入力した複数の Issue のストーリーポイントを連続して設定します。  
CSV のフォーマットは sample.csv を参照してください。  
ex. `$ set_storypoint.rb sprint_33.csv`  

## Limitations

- 指定された issue key の妥当性検証は行いません。  
- 指定された issue に既にストーリーポイントが設定されていても上書きします。
