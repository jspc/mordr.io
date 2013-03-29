#!/usr/bin/env ruby
#
# Todo List Item controller

module MordrItem

  def _list_object handle, slug
    MordrList::find_list handle, slug
  end

  def all_items handle, slug
    if list_o = _list_object( handle, slug )
      return list_o.items
    end
    return []
  end

  def find_item handle, slug, text
    all_items( handle, slug ).each do |item|
      return item if item.text == text
    end
    return false
  end

  def find_item_by_id handle, slug, id
    all_items( handle, slug ).each do |item|
      return item if item._id.to_s == id
    end
    return false
  end

  def add_item handle, slug, text, desc
    return nil if find_item( handle, slug, text )

    list_o = _list_object( handle, slug )
    list_o.items << Item.new(
                             :text => text,
                             :desc => desc
                             )
    list_o.save
  end

  def delete_item handle, slug, id
    list_o = _list_object handle, slug
    if list_o
      list_o.items.delete_if{ |item| item._id.to_s == id }
      list_o.save
    end
  end

  def set_done handle, slug, id
    item_o = find_item_by_id( handle, slug, id )
    if item_o
      item_o.done = true
      item_o.save
    end
  end

  def set_not_done handle, slug, id
    item_o = find_item_by_id( handle, slug, id )
    if item_o
      item_o.done = false
      item_o.save
    end
  end

end
