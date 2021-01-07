# README

## アプリケーション名
  Club Schedule App

## アプリケーション概要
  スポーツチーム対象のカレンダーと記事投稿アプリケーションを作成しました。

## URL

  ### **http://ec2-54-199-115-86.ap-northeast-1.compute.amazonaws.com**

## テストアカウント
### 通常アカウント
  メールアドレス:test_man@example.com
  パスワード:test#123
### googleアカウント
  メールアドレス名: testapp.katou@gmail.com
  パスワード:test#123

## 開発環境
Ruby '2.6.5' / Ruby on Rails '6.0.0' / MySQL / GitHub / Heroku / Visual Studio Code

## 利用方法


## 目指した課題解決


## 洗い出した要件


## 実装した機能


## 実装予定の機能


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
👉 http://localhost:3000