require 'byebug'
require_relative 'pilas'
def limpiar_pantalla
    system ("clear")
end

def ingreso_de_datos(array)
    print 'Ingrese los numeros: '
    numeros = gets.chomp
    numros2 = numeros.split(',')
    numros2.each do |cadena|
     array.push(cadena)
    end
  size=array.size
  for i in 0..size-1
    array[i] = array[i].to_i
  end
end
def ordenar_por_metodos(array, pila)
    begin
        puts '1. Cola'
        puts '2. Pila'
        puts '3. Listas'
        puts '4. salir'
        puts 'Ingrese la opcion. '
    opcion = gets.chomp
    limpiar_pantalla()
    if opcion == '1'
    elsif opcion == '2'
        if array.size != 0
            arreglob = array.join(' => ')
            pila.ordenar_pila(array)
            pila.mostrar_tabla (arreglob)#arreglado
        else
            puts 'ingrese valores'
        end 
    elsif opcion == '3'
    end
    limpiar_pantalla
end while opcion != '4'
end 
pila = Pila.new
array = []
begin
    puts '1. Ingreso de numeros'
    puts '2. Ejecutar ordenamiento'
    puts '3. Ordenar paso a paso'
    puts '4. salir'
    opcion = gets.chomp
    limpiar_pantalla
    if opcion == '1'
     ingreso_de_datos(array)
    elsif opcion == '2'
        ordenar_por_metodos(array, pila)
    elsif opcion == '3'
    end
    limpiar_pantalla
end while opcion != '4'