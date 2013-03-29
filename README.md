Mordr.io
==

Simple todo list bits and bobs. Actually a simple app in and of it's self.


What the fuck have you done?
--

So; it really occurs to me that I've done a very stupid MVC thing with Sinatra. I'll explain.

Controllers and Models are in `lib/`:
```bash
14:02 pm jspc@egg.zero-internet.org.uk :: ~/projects/mordr/lib $(rm_-rf) /usr/local/Cellar/tree/1.6.0/bin/tree 
.
├── models
│   ├── item.rb
│   ├── mlist.rb
│   └── user.rb
├── mordr-item.rb
├── mordr-list.rb
└── mordr-user.rb

1 directory, 6 files
```

Application stuff lives in `app/`:

```bash
14:02 pm jspc@egg.zero-internet.org.uk :: ~/projects/mordr/app $(rm_-rf) /usr/local/Cellar/tree/1.6.0/bin/tree 
.
├── mordr_config.rb
└── mordr_routes.rb

0 directories, 2 files
```

With the main executable in `mordr\mordr.io.rb` - this largely just calls everything else. Fucked up, no?

Basic Shell
--

The basic shell of this app (for the pretty stuff; you can get back here on commit 518d190762649e4f38c434c64180a384f9488c46):

```bash
.
├── Gemfile
├── Gemfile.lock
├── README.md
├── app
│   ├── mordr_config.rb
│   └── mordr_routes.rb
├── etc
├── lib
│   ├── models
│   │   ├── item.rb
│   │   ├── mlist.rb
│   │   └── user.rb
│   ├── mordr-item.rb
│   ├── mordr-list.rb
│   └── mordr-user.rb
├── log
├── mordr
│   └── mordr.io.rb
└── views
    ├── index.erb
    └── layout.erb

7 directories, 14 files
```