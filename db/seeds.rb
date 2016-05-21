# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Post.create([{email: 'rhj4862@gmail.com'}, {content: '테스트 1 글입니다~'}, {tags: '#테스트태그1 #테스트태그2'}, {image_url: ''}])
Comment.create([{content: '테스트1 댓글입니다. _1'}, {post_id: 1}, {image_url: ''}])

Post.create([{email: 'rhj4862@gmail.com'}, {content: '테스트 2 글입니다~'}, {tags: '#테스트태그1 #테스트태그2 #테스트태그3'}, {image_url: ''}])
Comment.create([{content: '테스트2 댓글입니다. _1'}, {post_id: 2}, {image_url: ''}])
Comment.create([{content: '테스트2 댓글입니다. _2'}, {post_id: 2}, {image_url: ''}])