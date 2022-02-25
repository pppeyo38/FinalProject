# README

# Project Title
『A Rest』

# Videp Demo
<URL https://www.youtube.com/watch?v=Hc5d4KEHVpo>

# 使用言語
Ruby on Rails

# プロジェクト内容
このプロジェクトは、カフェでのひとときを共有するSNSサービスです。
色んな人とのコミュ二ケーションだけはなく、カフェ探しやカフェでの過ごし方の参考にもなると考えています。

このサービスは、ユーザーネームとユニークなメールアドレス、パスワードを用いてユーザー登録をすることで使用可能です。
主な実装機能は、大きく分けて「投稿」、「他の人の投稿へのアクション(いいね！)」、「ユーザー情報の編集」の3つです。

# 実装について
RailsはMVCフレームワークであったため、CS50で習得したFlaskでの考え方やインターネット上の学習サイトを参考に独学で開発しました。
主に作成に力を注いだファイルは以下の通りです。
・app/views
「V(ビュー)」にあたる、ページの見た目を作るためのHTMLファイルです。
特にlayoutファイルには、どのページにも共通しているコード(例えばヘッダーなど)を書き、コードの簡潔化を目指しました。
・app/assets/styleshhets
HTMLとともに見た目を整えるためのCSSファイルです。FlexBoxを用いて整えている箇所が多いかと思います。
・app/controllers
「C(コントローラー)」にあたる、ページを表示する際に使用するビューをブラウザに返すファイルです。
コントローラーファイルの中にはたくさんのアクションが含まれていますが、これはブラウザに返すビューをviewsファイルから見つけ出す役割を担っています。
・config/routes.rb
ブラウザとコントローラーをつなぐ役割を果たしています。
送信されたURLに対して「どのコントローラーの、どのアクション」を呼び出して処理をするのかを決めています。
・db/migrate, schema.rb
「M(モデル)」にあたる、データベースを管理しているファイルです。
マイグレーションファイルという、データベースに変更を指示するファイルを作成することでテーブルの作成やカラムの追加を行いました。

# 実装するにあたって
Webアプリケーションに興味をもち、Flaskの他にもフレームワークを使ってみたいと考えRailsを採用しました。
数行のコードを書くだけで、色んな動きを可能にすることから理解に追いつけないところもありましたが、簡潔なコードでここまでの機能を実現できるところにとても興味を持ちました。この作成をきっかけに、Railsをさらに学習したいです。