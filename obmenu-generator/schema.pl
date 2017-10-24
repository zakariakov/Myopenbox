#!/usr/bin/perl

# obmenu-generator - schema file

=for comment

    item:      add an item inside the menu               {item => ["command", "label", "icon"]},
    cat:       add a category inside the menu             {cat => ["name", "label", "icon"]},
    sep:       horizontal line separator                  {sep => undef}, {sep => "label"},
    pipe:      a pipe menu entry                         {pipe => ["command", "label", "icon"]},
    file:      include the content of an XML file        {file => "/path/to/file.xml"},
    raw:       any XML data supported by Openbox          {raw => q(xml data)},
    begin_cat: beginning of a category              {begin_cat => ["name", "icon"]},
    end_cat:   end of a category                      {end_cat => undef},
    obgenmenu: generic menu settings                {obgenmenu => ["label", "icon"]},
    exit:      default "Exit" action                     {exit => ["label", "icon"]},

=cut

# NOTE:
#    * Keys and values are case sensitive. Keep all keys lowercase.
#    * ICON can be a either a direct path to an icon or a valid icon name
#    * Category names are case insensitive. (X-XFCE and x_xfce are equivalent)

require "$ENV{HOME}/.config/obmenu-generator/config.pl";

## Text editor
my $editor = $CONFIG->{editor};

our $SCHEMA = [
	{sep => "ArchLInux"},
    #          COMMAND                 LABEL                ICON
    #{item => ['xdg-open .',        'File Manager',      'file-manager']},
    #{item => ['xterm',             'Terminal',          'terminal']},
    #{item => ['xdg-open http://',  'Web Browser',       'web-browser']},
    {item => ['rofi -show run',                        'تشغيل تطبيق',       'system-run']},
    {sep => undef},
    {item => ['elokab-terminal',                              'الطرفية',          'terminal']},
   # {item => ['vivaldi-stable',                                      'متصفح الويب',       'vivaldi']},
   # {item => ['caja --no-desktop',                             'مدير الملفات',      'folder']},
   # {item => ['pluma',                                        'محرر النصوص',       'text-editor']},
   # {item => ['vlc',                                          'قارئ الوسائط',      'vlc']},
     {sep => undef},

    #{sep => 'Applications'},
	# {begin_cat => ['التطبيقات', 'applications-other']},
    #          NAME            LABEL                ICON
   		{cat => ['utility',     'ملحقات', 'applications-utilities']},
        {cat => ['system',      'النظام',      'applications-system']},
    	{cat => ['graphics',    'الرسومات',    'applications-graphics']},
    	{cat => ['audiovideo',  'الوسائط',  'applications-multimedia']},
    	{cat => ['network',     'الانترنت',     'applications-internet']},
    	{cat => ['development', 'التطوير', 'applications-development']},
    	{cat => ['education',   'تعليمي',   'applications-science']},
    	{cat => ['game',        'الالعاب',       'applications-games']},
    	{cat => ['office',      'المكتب',      'applications-office']},
    	{cat => ['other',       'تطبيقات أخرى',       'applications-other']},
    	{cat => ['settings',    'اعدادات',    'gnome-settings']},
    	

    #{cat => ['qt',          'QT Applications',    'qt4logo']},
    #{cat => ['gtk',         'GTK Applications',   'gnome-applications']},
    #{cat => ['x_xfce',      'XFCE Applications',  'applications-other']},
    #{cat => ['gnome',       'GNOME Applications', 'gnome-applications']},
    #{cat => ['consoleonly', 'CLI Applications',   'applications-utilities']},
	#{end_cat => undef},
    
	{sep => undef},

    # Preferences
    {begin_cat => ['التفظيلات', 'preferences-desktop-theme']},

        # Openbox category
        
        
        {item => ['tint2conf',          'Tint2 اعداد',    'tint2conf']},
        {sep => undef},
        {item => ['lxappearance',                           'المظهر',             'preferences-desktop-theme']},
        {item => ['gksudo lightdm-gtk-greeter-settings',    'اعدادات مدير الولوج',       'preferences-desktop-theme']},
        {item => ['rofi-theme-selector',                    'Rofi مظهر',          'preferences-desktop-theme']},
		{item => ['qt5ct',                    'Qt مظهر',          'preferences-desktop-theme']},
        #{item => ['geany ~/.config/termite/config',         'Termite Appearance',       'theme']},
        #{item => ["gksudo geany /etc/oblogout.conf",            'Exit Appearance',          'theme']},
        {item => ['nitrogen',                               'اختيار خلفية',         'nitrogen']},
        #{sep => undef},
        #{item => ['xfce4-notifyd-config',                   'Notifications',            'notifications']},
        #{item => ['pavucontrol',                            'Pulseaudio Preferences',   'multimedia-volume-control']},
        #{item => ['oomox-gui',                              'Oomox',                    'preferences-desktop-theme']},
        #{sep => undef},
        #{item => ['exo-preferred-applications',             'Preferred Applications',   'preferred-applications']},
        #{item => ['xfce4-power-manager-settings',           'Power Management',         'power']},
        #{item => ['xfce4-settings-manager',                 'Xfce4 Settings Manager',   'preferences-desktop']},
        #{item => ["dmenu_run -i -nb '#191919' -nf '#fea63c' -sb '#fea63c' -sf '#191919' -fn 'NotoMonoRegular:bold:pixelsize=14'", 'Dmenu', 'alacarte']},
        #{item => ['arandr',                                 'Screen Layout Editor',     'display']},
        #{item => ['system-config-printer',                  'Printing',                 'printer']},
        #{pipe => ['al-printing-pipemenu', 'Printing', 'printer']},
    {end_cat => undef},

	{sep => undef},
	{begin_cat => ['أوبن بوكس', 'openbox']},
            {item => ["$editor ~/.config/openbox/menu.xml",     'تحرير menu.xml',                 'text-xml']},
            {item => ["$editor ~/.config/openbox/rc.xml",       'تحرير rc.xml',                   'text-xml']},
            {item => ["$editor ~/.config/openbox/autostart",    'تحرير autostart',                'text-xml']},
            #{sep => undef},
            #{item => ['obmenu3',                                'GUI Menu Editor',               'theme']},
            #{item => ['obconf',                                 'GUI Config Tool',               'theme']},
            #{item => ['obkey',                                  'GUI Keybinds',                  'theme']},

            {sep => undef},
            {item => ['openbox --restart',                      'اعد تحميل أوبن بوكس',               'openbox']},
            {item => ['openbox --reconfigure',                  'تحديث اعدادات أوبن بوكس',           'openbox']},
        {end_cat => undef},
     # Preferences
    #{begin_cat => ['System Settings', 'settings']},
     #   {item => ['pamac-manager',  'Pamac Package Manager',    'pamac']},
      #  {item => ['pamac-updater',  'Pamac Package Updater',    'pamac']},
       # {sep => undef},
        #{item => ["gksudo caja",  'File Manager As Root',     'thunar']},
        #{item => ["gksudo geany",   'Text Editor As Root',      'geany']},
        #{sep => undef},
        #{item => ["gksudo geany /etc/lightdm/lightdm-gtk-greeter.conf /etc/lightdm/lightdm.conf",  'Login Settings','login']},
        #{item => ["gksudo gparted", 'GParted',                  'gparted']},
        #{sep => undef},
        #{item => ["gnome-disks", 			'Disks',                  				'gnome-disks']},
        #{item => ["hardinfo", 				'System Profiler and Benchmark',       	'hardinfo']},
        #{item => ["xfce4-taskmanager", 		'Taskmanager',                  		'gnome-system-monitor']},

    #{end_cat => undef},

    {sep => undef},
    # obmenu-generator
    {begin_cat => ['مولد القوائم', 'menu-editor']},
        {item => ["$editor ~/.config/obmenu-generator/schema.pl", 'Menu Schema', 'text-x-source']},
        {item => ["$editor ~/.config/obmenu-generator/config.pl", 'Menu Config', 'text-x-source']},
        {sep  => undef},
        #{item => ['~/.config/obmenu-generator/obmenu-generator -p',       'Generate a pipe menu',              'menu-editor']},
        {item => ['~/.config/obmenu-generator/obmenu-generator -s -c',    'ولد قائمة قياسية',            'menu-editor']},
        #{item => ['~/.config/obmenu-generator/obmenu-generator -p -i',    'Generate a pipe menu with icons',   'menu-editor']},
        {item => ['~/.config/obmenu-generator/obmenu-generator -s -i -c', 'ولد قائمة قياسية مع ايقونات', 'menu-editor']},
        {sep  => undef},
        {item => ['~/.config/obmenu-generator/obmenu-generator -d',       'تحديث الايقونات',                  'gtk-refresh']},
    {end_cat => undef},

    #{sep => undef},
    #{item => ["archlabs-hello", 			    'ArchLabs Hello',       	         'archlabs-hello']},
    #{pipe => ['al-help-pipemenu',              'Help &amp; Resources',              'info']},
    #{pipe => ['al-kb-pipemenu',                'Display Keybinds',                  'cs-keyboard']},
    ## The xscreensaver lock command
   
    {sep => undef},
    {item => ['xscreensaver-command -lock', 'قفل الشاشة', 'system-lock-screen']},
    #{item => ['slimlock',                      'Lock Screen',                       'log-out']},
    #{item => ['openbox --exit',                      'الخروج',                      'exit']},
     ## This option uses the default Openbox's "Exit" action
    # {exit => ['الخروج', 'application-exit']},

    ## This uses the 'oblogout' menu
    {item => ['oblogout', 'الخروج', 'application-exit']},
]
