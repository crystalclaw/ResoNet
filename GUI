#simple GUI
from tkinter import *
#create the window
root = Tk()

#modify root window
root.title("simple GUI")
root.geometry("450x450")

mEntry = Entry
ment = StringVar()
app = Frame(root)
app.grid()

    
menu = Menu(root)
root.config(menu=menu)

subMenu = Menu(menu)
menu.add_cascade(label="outputs", menu=subMenu)
subMenu.add_command(label="output 1", command=("i dont know what i am yet"))
subMenu.add_command(label="output 2", command=("still no idea"))
                                            

mEntry = Entry(root, textvariable=ment).grid()

app = Frame(root)
app.grid()
button = Button(app, text = "Connect to IP")

button.grid()

app = Frame(root)
app.grid()
button = Button(app, text = "Disconnect")
button.grid()

button = Button(root, text="Find IP?", command=("i dont know what i am yet"))
#Button(master, text=show_entry_fields).grid(row=(insert later), column=(insert later), sticky=(insert later), pady=(insert later)) Remove parenthesis with insert later when changed



