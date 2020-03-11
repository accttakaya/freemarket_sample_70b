class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    4.times { @item.itemimages.build }
    @prefectures = prefectures
    @parents = Category.where(ancestry:nil)
  end

  def create
    Item.create(item_params)
  end

  def search
    respond_to do |format|
      format.html
      format.json do
       @children = Category.find(params[:parent_id]).children
       #親ボックスのidから子ボックスのidの配列を作成してインスタンス変数で定義
      end
    end
  end

  private
  def item_params
    params.require(:item).permit(:name,:explanation,:category,:brand,:condition,:postage,:area,:day,:price,itemimages_attributes: [:image]).merge(user_id:1)
  end

  def prefectures
    prefectures = [['北海道','北海道'],['青森県','青森県'],['岩手県','岩手県'],
    ['宮城県','宮城県'],['秋田県','秋田県'],['山形県','山形県'],['福島県','福島県'],
    ['茨城県','茨城県'],['栃木県','栃木県'],['群馬県','群馬県'],['埼玉県','埼玉県'],
    ['千葉県','千葉県'],['東京都','東京都'],['神奈川県','神奈川県'],['新潟県','新潟県'],
    ['富山県','富山県'],['石川県','石川県'],['福井県','福井県'],['山梨県','山梨県'],
    ['長野県','長野県'],['岐阜県','岐阜県'],['静岡県','静岡県'],['愛知県','愛知県'],
    ['三重県','三重県'],['滋賀県','滋賀県'],['京都府','京都府'],['大阪府','大阪府'],
    ['兵庫県','兵庫県'],['奈良県','奈良県'],['和歌山県','和歌山県'],['鳥取県','鳥取県'],
    ['島根県','島根県'],['岡山県','岡山県'],['広島県','広島県'],['山口県','山口県'],
    ['徳島県','徳島県'],['香川県','香川県'],['愛媛県','愛媛県'],['高知県','高知県'],
    ['福岡県','福岡県'],['佐賀県','佐賀県'],['長崎県','長崎県'],['熊本県','熊本県'],
    ['大分県','大分県'],['宮崎県','宮崎県'],['鹿児島県','鹿児島県'],['沖縄県','沖縄県']]
  end

  def show
    @item = Item.find(params[:id])
    @itemimages = @item.itemimages.all
    @category = Category.find(@item.category_id)
  end

  def destroy
  end


end

