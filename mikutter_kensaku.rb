# -*- coding: utf-8 -*-

Plugin.create(:mikutter_kensaku) do
  baseurl = "http://www.google.co.jp"

  on_posted do |srv, mesg|
    mesg.each do |m|

      if m.message.to_s =~ /\[[\w\W]*\]\[検索\]/ then
        word = ""
        word << m.message.to_s
        word.slice!(/\[検索\]/); word.slice!(0); word.slice!(-1)
        Gtk::openurl(baseurl + "#q=" + word)
      end
    end
  end
end
