# ルート
crumb :root do
  link "FURIMA", root_path
end

# マイページ
crumb :mypage do
  link "マイページ", user_path
end
# 出品ページ
crumb :item_new do
  link "出品する ", new_item_path
end
# カテゴリー一覧
crumb :category do
  link "カテゴリー一覧", categories_path
end
# 親カテゴリー
crumb :parent do |category|
  category = Category.find(params[:id]).root
  link "#{category.name}", category_path(category)
  parent :category
end
# 子カテゴリー
crumb :child do |category|
  category = Category.find(params[:id])
  # 子カテゴリーか確認する
  if category.has_children?
    link "#{category.name}", category_path(Category)
    parent :parent
  else
    link "#{category.parent.name}", category_path(category.parent)
    parent :parent
  end
end
# 孫カテゴリー
crumb :grandchild do |category|
  category = Category.find(params[:id])
  link "#{category.name}", category_path(category)
  parent :child
end
# アイテム
crumb :item do |item|
  item = Item.find(params[:id])
  link "#{item.name}", item_path
  parent :grandchild
end
# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
