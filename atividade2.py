import pyautogui as py
import time as t

contatos = ["Gabriel Mazur Fatec", "Pedro Abreu", "Pedro Fatec."]
mensagem = "Conseguimos realizar a automatização "

t.sleep(1)
py.press('winleft')
t.sleep(1)
py.write('google')
t.sleep(1)
py.press('enter')
t.sleep(2)
py.write("https://web.whatsapp.com")
py.press('enter')
t.sleep(10) 


for contato in contatos:


    t.sleep(1)
    

    py.press('tab')
    py.press('tab')
    py.press('tab')
    py.press('tab')
    t.sleep(1)
    
    
    py.write(contato, interval=0.05)
    t.sleep(2)
    
    
    py.press('enter')
    t.sleep(2)
  
    
    py.write(mensagem, interval=0.05)
    py.press('enter')
    
    t.sleep(2)

    py.press('tab')

print("Mensagens enviadas com sucesso ")