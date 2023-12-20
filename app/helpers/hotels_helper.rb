module HotelsHelper
  def image_for_random_id(random_id)
    if random_id < 115
      image_tag('onsensaru.png', size: '100x200', alt: '宿泊客') +
        content_tag(:p, '雪肌精と露天風呂があると噂の宿は・・・')
    else
      image_tag('neko.png', size: '100x200', alt: '猫') +
        content_tag(:p, '看板猫がいると噂の癒しの温泉宿は・・・')
    end
  end

end
