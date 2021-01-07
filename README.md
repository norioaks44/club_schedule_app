# README

## アプリケーション名
  ### Club Schedule App

## アプリケーション概要
  スポーツチーム対象のカレンダーと記事投稿アプリケーションを作成しました。
  ラグビーチームを元にしています。
## URL

  #### http://ec2-54-199-115-86.ap-northeast-1.compute.amazonaws.com

## テストアカウント
### 通常アカウント
    メールアドレス:test_man@example.com
    パスワード:   test#123
### googleアカウント
    メールアドレス名: testapp.katou@gmail.com
    パスワード:   test#123

## 開発環境
    Ruby '2.6.5' / Ruby on Rails '6.0.0' / MySQL / GitHub / Heroku / Visual Studio Code

## 利用方法
  カレンダー機能：活動日、OFF、試合日を表示可能です。
  解説投稿機能：技術・戦術解説を画像や動画含めて表示可能です。
  試合レビュー投稿機能：試合についてのコメントや動画URLを表示可能です。

## 目指した課題解決
  - チームでの予定把握（選手、スタッフの全体）
  - チームでの決まり事、戦術、名称などを共有
  - 試合で評価をチーム全体で共有

## 洗い出した要件
  - 活動日を1日毎に管理し共有する。試合や休日も共有する。
  - 細かい練習メニュー、スポーツの理解度やスキルの向上を図る。
  - 試合の評価をスタッフからの目線で選手に伝える。
  - 動画像を扱うため、レスポンス速度を向上させる。
  - 選手が個人的に気になったことを、すぐに解決できるようにする。
  - ログインを簡略化図る。

## 実装した機能
  - カレンダー機能
  #### https://gyazo.com/048d72617b32c862853585c5a2684ff6

  - 画像・動画投稿機能
  #### https://gyazo.com/197df70bb38965c0ce123b9e000cb962

  - 試合レビュー投稿機能
  #### https://gyazo.com/3c6c85e3ca82a614f84d850bdc6c092e

  - AWS EC2・S3での運用
  - 記事検索機能
  #### https://gyazo.com/6d9e6be9c32c8bf429f91c6d70972994
  - SNS認証


## 実装予定の機能
  - レスポンシブデザイン
  - 選手の身体、ウエイトトレーニングデータをグラフで可視化

## テーブル設計

### users テーブル

| Column              | Type    | Options     |
| ------------------- | ------- | ----------- |
| name                | string  | null: false |
| email               | string  | null: false |
| password_encrypted  | string  | null: false |
| grade_id            | integer | null: false |
| position_id         | integer | null: false |

#### Association
- has_many :events
- has_many :skills
- has_many :reviews

### events テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| title_id        | integer    | null: false                    |
| info            | text       | null: false                    |
| start_time      | date       | null: false                    |
| meeting_time_id | integer    | null: false                    |

#### Association

- belongs_to :user
- has_one :review

### skills テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| drill_name      | string     | null:false                     |
| info            | string     | null:false                     |
| category_id     | integer    | null:false                     |
| genre_id        | integer    | null:false                     |
| skill_url       | string     |                                |

#### Association
- belongs_to :user

### reviews テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| event_match     | references | null: false, foreign_key: true |
| match_genre_id  | integer    | null:false                     |
| comment         | text       | null:false                     |
| match_url       | text       |                                |

#### Association
- belongs_to :event
- belongs_to :user

## ローカルでの動作方法
    $ git clone https://github.com/norioaks44/club_shcedule_app.git
    $ cd club_shcedule_app
    $ bundle install
    $ rails db:create
    $ rails db:migrate
    $ rails s
    http://localhost:3000