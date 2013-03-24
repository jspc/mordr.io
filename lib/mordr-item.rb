#!/usr/bin/env ruby
#
# Todo List Item controller

require 'models/item'

module MordrItem
  def find_item list_o, text
    list_o.items.find( :text => text ).first
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
    item_o.destroy unless item_o.nil?
  end

  def set_done list_o, title
    item_o = find_item list_o, text
    item_o.done = true unless item_o.nil?
  end
end
