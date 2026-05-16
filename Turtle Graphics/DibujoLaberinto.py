from turtle import*
import turtle
import re
turtle.setup(900, 900) #Tamaño de la pantalla 
wn = turtle.Screen()     
wn.title("Terreneitor!!") 
hideturtle()
dot(5, 0, 0, 0)

carrito = turtle.Turtle() #Nombrar el objeto turtle como carrito

# Inicializa los arreglos
izquierda = []
centro = []
derecha = []
trayecto = []
valores = ['0', '1', '2', 'B', 'Y', 'P', 'G']
# Abre el archivo en modo lectura
with open('/Users/semil/OneDrive/Documentos/Isaac/Carrito/Trayecto.txt', 'r') as archivo:
    # Lee el contenido del archivo y elimina espacios en blanco
    for linea in archivo:
        for i in valores:
            if i in linea:
                trayecto.append(i)

# Convierte el contenido en una lista de números
# Los números están separados por espacios
# Recorre cada número en la lista
for direccion in trayecto:
    if direccion == '0': # El carrito se mueve a la izquierda
        carrito.left(90)
        izquierda.append(direccion) # El carrito se mueve a la centro
    elif direccion == '1':
        carrito.forward(10)
        centro.append(direccion)
    elif direccion == '2': # El carrito se mueve a la derecha
        carrito.right(90)
        derecha.append(direccion)
    if direccion == 'B':
        carrito.dot(10, 'Blue')
    if direccion == 'P':
        carrito.dot(10, 'Pink')
    if direccion == 'Y':
        carrito.dot(10, 'Yellow')
    if direccion == 'G':
        carrito.dot(10, 'Green')
    else:
        print(f"Valor no esperado: {direccion}")
# Imprime los resultados
print("Arreglo izquierda:", izquierda)
print("Arreglo centro:", centro)
print("Arreglo derecha:", derecha)

wn.exitonclick()

# Imprime la lista ordenada
#print("Números ordenados :")
#print(numeros_ordenados)