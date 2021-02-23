# README
# テーブル設計

## usersテーブル
| Column             | Type   | Options                  |
| --------           | ------ | -----------              |
| nickname           | string | null:false               |
| email              | string | null:false, unique: true |
| encrypted_password | string | null:false               |
| first_name         | string | null: false              |
| last_name          | string | null: false              |
| first_name_kana    | string | null: false              |
| last_name_kana     | string | null: false              |
| birthday           | date   | null: false              |

### Association
- has_many :items
- has_many :comments
- has_many :buys


## itemsテーブル
| Column         | Type      | Options                       |
| --------       | ------    | -----------                   |
| product        | string    | null: false                   |
| description    | text      | null: false                   |
| category_id    | integer   | null: false                   |
| condition_id   | integer   | null: false                   |
| charge_id      | integer   | null: false                   |
| shipment_id    | integer   | null: false                   |
| day_id        | integer   | null: false                   |
| price          | integer   | null: false                   |
| user           | reference | null: false, foreign_key:true |

### Association
- belong_to :user
- has_many :comments
- has_one :buy


## buysテーブル
| Column    | Type       | Options                       |
| --------  | ------     | -----------                   |
| item      | references | null: false, foreign_key:true |
| user      | references | null: false, foreign_key:true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :buyer

## buyerテーブル
| Column        | Type       | Options                       |
| --------      | ------     | -----------                   |
| postal_code   | string     | null: false                   |
| shipment_id   | integer    | null: false                   |
| municipality  | string     | null: false                   |
| address       | string     | null: false                   |
| building      | string     |                               |
| phone_number  | string     | null: false                   |
| buy           | references | null: false, foreign_key:true |

### Association
- belongs_to :buy



## commentsテーブル
| Column    | Type       | Options                       |
| --------  | ------     | -----------                   |
| text      | text       | null: false                   |
| user_id   | references | null: false, foreign_key:true |
| item_id   | references | null: false, foreign_key:true |

### Association
- belongs_to :users
- belongs_to :items

