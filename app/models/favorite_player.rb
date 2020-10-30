class FavoritePlayer < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '西勇輝' },
    { id: 3, name: '藤浪晋太郎' },
    { id: 4, name: '藤川球児' },
    { id: 5, name: '梅野隆太郎' },
    { id: 6, name: '大山悠輔' },
    { id: 7, name: '糸原健斗' },
    { id: 8, name: '近本光司' },
    { id: 9, name: '糸井嘉男' },
    { id: 10, name: '原口文仁' },
    { id: 11, name: 'その他の選手' }
  ]
end
