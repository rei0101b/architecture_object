１、 androots　class 作成

#androots全体の会社情報や売り上げ、個人の情報を全社分調べ、そのデータを元にandrootsグループで新しい会社を作ります。
#androotsの人を総退職させ新たに会社を作っていきます

以下をmainで出力できる美しいclassをかいてください
# androotsの売上   sales　#=> Hide、UKIYOの売り上げ合計の98%
# androotsの経営陣(三社ともdefaultで修さんは入っている)　managers #=> ["eguchi shuichi", "shouhei yamamura", "orito noboru"]
# androotsの社員　　staff #=> []
# androotsのグループ会社　groups #=> [Hide, Hugkumi, UKIYO]
# ukiyoの代表　　　　ceo #=> eguchi shuichi
# ukiyoの業種　　　　industory #=> ["marketing", "IT"]
# ukiyoの売上　　sales #=> 10000000 + hideの売り上げの10%
# ukiyoのエンジニアの数　enginners.count #=> 3
# Hideのパートの人数　part.counts #=> 12
# shuさんの苗字　　　last_name #=> eguchi
# shuさんの所属会社　company #=> ["androots", "hugkumipulus", "fromcocoro", "hide&seek" "ukiyocreate"]
# reiさんのスキル(androots社員はcommunicationをもってる)　　　skills #=> ["communication"]
# takumiさんのスキル　skills #=> ["engineering", "management", "communication"]
# takumiさんの筋肉　muscle #=> 100
# takumiさんの所属ジム　gym #=> 100
# sakikoさんのスキル　skills #=> ["marketing", "communication"]
# Hide、Hugkumi、UKIYOの三社の個々の総スキルリスト　skills #=> ["marketing", "communication", "engineering", "management"]
# hogeさんがHideに入社(androotsに入社制度はない)　　enter #=> void
# hideの売り上げを50万増加
# androotsグループにHoge会社を増やす　#groups =>　['Hide', 'Hugkumi', 'UKIYO', 'Hoge']
# UKIYOからreiを退社させる

# 会社の機能
# 売り上げを増減できる
# 入社・退社ができる
# ビジネス業界がある
# 会社の経営陣に必ず修さん（創始者）さんはいる
# ceoは創始者でなくてもいい
# ceoはmanagerに含まれる
# Hideのパートさんの数は社員 + 10人
# 1 HideandSeek　classの作
# UKIYOの社員は３０歳以下しか入れない
# androotsはconceptbookをくれる

人　
名前がある
スキルがある(全員コミュニケーション能力はもっている)

ukiyo エンジニアのは ？
社長の名前は?

#Hide ukiyoへのfeeは売り上げの -> 20%
#Hugukumi  ukiyoへのfeeは売り上げの -> 10%


#staff 入社できるけど、なざしで退社できんくね/



def main
  androots = Androots.new
  androots.ceo #=> eguchi shuichi
  androots.managers #=> ["eguchi shuichi", "shouhei yamamura", "orito noboru"]
  androots.staff #=> []
  andtoots.industory #=> investiment
  andtoots.sales　#=> はぐくみ、ふろむ、Hide、fooot、UKIYOの売り上げ合計

  ukiyo = Ukiyocreate.new
  ukiyo.ceo #=> eguchi shuichi
  ukiyo.managers #=> eguchi shuichi
  ukiyo.staff #=> ["rei yamaguchi", "takumi sasamoto", "kohsuke tone"]
  ukiyo.industory #=> ["marketing", "IT"]
  ukiyo.sales #=> 10000000 + hideの売り上げの10%
  
  shuichi = EguchiShuich.new
  shuichi.name #=> eguchi shuich
  shuichi.first_name #=> shuich
  shuichi.last_name #=> eguchi
  shuichi.skills #=> ["marketing","management", "finance", "engineering"]
  shuichi.company #=> ["androots", "hugkumipulus", "fromcocoro", "hide&seek" "ukiyocreate"]


  takumi = EguchiShuich.new
  takumi.name #=> takumi sasamoto
  takumi.first_name #=> takumi
  takumi.last_name #=> sasamoto
  takumi.skills #=> ["engineering","management"]
  takumi.muscle #=> 100


end