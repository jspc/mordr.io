#!/usr/bin/env ruby
#
# Todo List Item controller

module MordrItem
  def find_item list_o, text
    item_o = list_o.items
    return item_o unless item_o.nil?
    return false
  end

  def new_item list_o, text, desc
    return nil if find_item( list_o, text )
    item_o = list_o.create( :items => [ Item.new(
                                                 :text => text,
                                                 :desc => desc
                                                 )
                            ])
    item_o.save
  end

  def del_item list_o, text
    item_o = find_item list_o, text
    item_o.destroy if item_o
  end

  def set_done list_o, title
    item_o = find_item list_o, text
    item_o.done = true if item_o
    item_o.save
  end
end
