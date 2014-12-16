# coding: utf-8
module NicoCmd

  class Command < Thor

    desc 'my_list', 'mylist list videos '
    option :mylist_id, :type => :string, :aliases => '-m',
      :required => true, :desc => "target mylist id"
    def mylist
      login unless @niconico
      p @niconico.mylist(options[:mylist_id])
    end
  end
end

