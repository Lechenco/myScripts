from i3ipc import Connection
from subprocess import call

i3 = Connection()

def modeNotify(i3, event):
    print(event.change)
    if event.change == 'default':
        call('polybar-msg hook i3mode 1'.split(' '))
    elif event.change == 'resize':
        call('polybar-msg hook i3mode 2'.split(' '))
    elif event.change == 'move':
        call('polybar-msg hook i3mode 3'.split(' '))

i3.on("mode", modeNotify)

i3.main()
