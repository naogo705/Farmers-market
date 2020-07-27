# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# アプリ名
Farmers-market

# 概要
- ユーザー登録ができます。
- 登録者は画像と投稿文を載せた投稿ができます。
- 投稿者は投稿に対して編集、削除ができます。
- 投稿はログアウト状態でも閲覧可能です。
- ログイン状態の場合は各投稿にコメントができます。

# 制作背景
私の両親は農業をしており、育てた農作物は地元のお客様からご愛顧いただき、たくさんのお言葉を頂いております。その中でも多くのお言葉として頂くのが次はいつ収穫されますかというご質問です。そこで私は農家の方が気軽に投稿できるアプリを開発しようと考えました。投稿内容にコメントができるようにすることで、今まで農家の方に直接お聞きしていたのが簡単にご質問が可能になります。これによりお互いのコミュニケーションも取りやすくなり、お客様もお買い物がしやすくなると考えたことが制作背景です。

# DEMO
- トップページ
[![Image from Gyazo](https://i.gyazo.com/2b279d64a35ba3c59c2152a3a1bbee89.jpg)](https://gyazo.com/2b279d64a35ba3c59c2152a3a1bbee89)
- 投稿画面と完了ページ
[![Image from Gyazo](https://i.gyazo.com/b3eb7f1f4757ffa5c6edd7edd6a59fdd.jpg)](https://gyazo.com/b3eb7f1f4757ffa5c6edd7edd6a59fdd)
[![Image from Gyazo](https://i.gyazo.com/25cba7f5ef8e7f5ac53389b1417a02db.jpg)](https://gyazo.com/25cba7f5ef8e7f5ac53389b1417a02db)

- コメント機能
[![Image from Gyazo](https://i.gyazo.com/8e9a22b4e8e31c4d8e33337624ee220c.jpg)](https://gyazo.com/8e9a22b4e8e31c4d8e33337624ee220c)

# 実装予定の内容
投稿に対して、「良いね」機能をつけたいです。
「良いね」登録をすることで気になった投稿をいつでも確認できるようにマイページに「良いね」欄を作成したいと思ってます。

# DB設計

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null:false|

### Association
- has_many :tweets
- has_many :comments
- has_many :favorites
- has_many :tweets, through: :favorites

## tweetsテーブル

|Column|Type|Options|
|------|----|-------|
|text|string|
|image|string|
|user_id|integer|

### Association
- belongs_to :user
- has_many :comments
- has_many :favorites, dependent: :destroy

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|
|tweet_id|integer|
|text|text|

### Association
- belongs_to :user
- belongs_to :tweet

## favoritesテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|foreign_key: true|
|tweet|references|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :tweet