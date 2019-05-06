# CafePedia

![Demo](https://raw.githubusercontent.com/wiki/toywonder/cafepedia/img/cafepedia_demo.gif)

## Description
カフェペディアは、現在地に近いカフェを探すことができるサービスです。電源、Wi-Fi、喫煙席などのお気に入りの設備のあるカフェもサクサク見つけることが出来ます。

## Deploy
### 注意点
- [ ] config/deploy.rb にブランチ名を書いたか
- [ ] デプロイ先はちゃんと変えたか
- [ ] サーバー上でnginxは起動しているか
- [ ] サーバー上でunicornは起動しているか
- [ ] サーバー上でmysqlは起動しているか

### 手順
1. developから **release/[1-9].[0-9].[0-9]** ブランチを作成

2. リリースするブランチを **config/deploy.rb** 10行目に記述(developから切ったブランチ)
    ```
    set :branch, 'release/1.0.0' #ここにリリースするブランチ名を書く
    ```

3. **config/deploy/production.rb** ファイルを編集。  
    3.1. # AWS-本番環境以下2行のコメントアウト。  
    3.1. # AWS-TEST環境以下2行のコメントをはずす。

4. デプロイを実行  
    4.1 capistranoでデプロイ
    ```
    bundle exec cap production deploy
    ```
    4.2 Unicornを停止
    ```
    bundle exec cap production unicorn:stop
    ```
    4.3 Unicornを起動
    ```
    bundle exec cap production deploy:restart
    ```

5. http://54.64.51.15 でデプロイが正常に出来ているか確認

6. **config/deploy/production.rb** ファイルを編集。  
    5.1. # AWS-TEST環境以下2行のコメントアウト。  
    5.2. # AWS-本番環境以下2行のコメントをはずす。
7. 本番にデプロイ（手順4と同じ）

### 管理画面へのログイン
URL： https://cafepedia.jp/login  
Email： toy.wonder70@gmail.com  
Password： .envファイルに記載
