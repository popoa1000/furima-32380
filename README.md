# README
# テーブル設計

## userテーブル
| Column     | Type   | Options                  |
| --------   | ------ | -----------              |
| nickname   | string | null:false, unique: true |
| email      | string | null:false, unique: true |
| password   | string | null: false              |
| name       | string | null: false              |
| birthday   | string | null: false              |

### Association
- has_many :items
- has_many :comments
- has_many :buy


## itemsテーブル
| Column     | Type      | Options                       |
| --------   | ------    | -----------                   |
| product    | string    | null: false                   |
| image      |           | null: false                   |
| category   | text      | null: false                   |
| condition  | text      | null: false                   |
| charge     | integer   | null: false                   |
| shipment   | integer   | null: false                   |
| days       | date      | null: false                   |
| price      | integer   | null: false                   |
| user       | reference | null: false, foreign_key:true |

### Association
- belong_to :users
- has_many :comments
- has_one :buy


## buyテーブル
| Column    | Type       | Options                       |
| --------  | ------     | -----------                   |
| item      | references | null: false, foreign_key:true |
| user      | references | null: false, foreign_key:true |

### Association
- belongs_to :users
- belongs_to :items
- has_one :buyer

## buyerテーブル
| Column    | Type       | Options     |
| --------  | ------     | ----------- |
| address   | string     | null: false |
| buy       | references | null: false |

### Association
- belongs_to :buy



## commentsテーブル
| Column    | Type      | Options                        |
| --------  | ------    | -----------                    |
| text      | text       | null: false                   |
| user      | references | null: false, foreign_key:true |
| item      | references | null: false, foreign_key:true |

### Association
- belongs_to :users
- belongs_to :items

