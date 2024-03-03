articles = [
    {
        slug: "1",
        title: "技術記事",
        description: "技術記事についての話",
        body: "課題の締めごとに技術記事を書く",
        tag_list: "＃技術"
    },
    {
        slug: "2",
        title: "ジョジョ",
        description: "スターダストクルセイダース",
        body: "スタンド使いの物語",
        tag_list: "ジョジョの奇妙な冒険"
    }
]

articles.each do |article| 
    Article.create(article)
end

