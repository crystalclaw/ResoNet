#Things that start with a ound sign are comments that arent read by the computer, like this for example

#simple GUI
from tkinter import *
#create the window
root = Tk()

#modify root window
root.title("ResoNet")
root.geometry("650x710")

#making words mean certain commands

mEntry = Entry
ment = StringVar()
app = Frame(root)
app.grid()

    
menu = Menu(root)
root.config(menu=menu)

#file menu

subMenu = Menu(menu)
menu.add_cascade(label="outputs", menu=subMenu)
subMenu.add_command(label="output 1", command=("i dont know what i am yet"))
subMenu.add_command(label="output 2", command=("still no idea"))
                                            
#the bar you can type in

mEntry = Entry(root, textvariable=ment).grid()

#the two buttons

app = Frame(root)
app.grid()
button = Button(app, text = "Connect to IP?")
button.grid()

app = Frame(root)
app.grid()
button = Button(app, text = "Disconnect")
button.grid()

#the comment below this that looks like a string of code is an unfinished string of code that i didnt want screwing things up while i edited others

#Button(master, text=show_entry_fields).grid(row=(insert later), column=(insert later), sticky=(insert later), pady=(insert later)) Remove parenthesis with insert later when changed





#kick off the event loop
root.mainloop()

