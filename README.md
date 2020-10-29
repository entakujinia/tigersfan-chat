# テーブル設計

## users テーブル

| Column            | Type         | Options                       |
| ----------------- | ------------ | ----------------------------- |
| nickname          | string       | null: false                   |
| email             | string       | null: false                   |
| password          | string       | null: false                   |
| encrypted_password| string       | null: false                   |
| fan_history       | string       | null: false                   |
| favorite_player   | string       | null: false                   |
