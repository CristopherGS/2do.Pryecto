require 'byebug'
def limpiar_pantalla
    system ("clear")
end

def ingreso_de_datos 
    limpiar_pantalla()
    puts 'Ingrese un arreglo de numeros para trabajar:'
    @arreglo = gets.chomp.split(',')
end
def  
end 
begin
    puts '1. Ingreso de numeros'
    puts '2. Ejecutar ordenamiento'
    puts '3. Ordenar paso a paso'
    puts '4. salir'
    opcion = gets.chomp
    limpiar_pantalla
    if opcion == '1'
     ingreso_de_datos
    elsif opcion == '2'

    elsif opcion == '3'
    end
    limpiar_pantalla
end while opcion != '4'