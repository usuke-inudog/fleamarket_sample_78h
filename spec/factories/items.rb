FactoryBot.define do
  
  factory :item do
    name            {"商品名"}
    introduction    {"説明"}
    price           {"10000"}
    brand_id        {FactoryBot.create(:brand).id}
    category_id     {FactoryBot.create(:category).id}
    item_condition  {"新品、未使用"}
    delivery_burden {"送料込み(出品者負担)"}
    delivery_method {"クロネコヤマト"}
    shipper         {"東京都"}
    shipping_day    {"1〜2日で発送"}
    size            {}
    seller_id       {FactoryBot.create(:user).id}
    buyer_id        {}
    deal_close_date {}
  end
  
end
