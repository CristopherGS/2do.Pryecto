require 'terminal-table'
def limpiar_pantalla
system('clear')
end
class Pila
        def initialize
            @pila = {
                tope: nil,
                size: 0,
                vacia: true
            }
            @pila_auxiliar = {
                tope: nil,
                size:0,
                vacia: true
            }
            @procedimientos=[]
            @enlace=""
        end

        def insertar_en_pila_auxiliar(valor)

            nodo = {
                valor: valor,
                siguiente: nil,
            }
            if @pila_auxiliar[:vacia]
                @pila_auxiliar[:tope]=nodo
                @pila_auxiliar[:vacia]=false
                @pila_auxiliar[:size]+=1
            else
                tope=@pila_auxiliar[:tope]
                nodo[:siguiente]=tope
                @pila_auxiliar[:tope]=nodo
                @pila_auxiliar[:size]+=1
            end
        end

        def ingreso_de_menores
            if @pila_auxiliar[:tope]!=nil
            for i in 1..@pila_auxiliar[:size]
            valor = @pila_auxiliar[:tope][:valor]
            nodo = {
                valor:valor,
                siguiente: nil
            }
            tope = @pila[:tope]
            nodo[:siguiente]=tope
            @pila[:tope]=nodo
            siguiente = @pila_auxiliar[:tope][:siguiente]
            @pila_auxiliar[:tope]=siguiente
            @procedimientos.push(imprimir_la_pila())
            end
        end
        end
        
        def lim_menor(numero)
            nodo ={
                valor: numero,
                siguiente: nil
            }
            contador=1
            while contador<=@pila[:size]
                valor = @pila[:tope][:valor]
                if numero>valor && @pila[:tope][:siguiente]==nil
                    insertar_en_pila_auxiliar(valor)
                    @procedimientos
    .push("eliminar #{valor}")
                    @pila[:tope]=nodo
                    @pila[:size]+=1
                    contador=@pila[:size]+1
                    @procedimientos
    .push(imprimir_la_pila())
                elsif numero ==valor
                    tope = @pila[:tope]
                    nodo[:siguiente]=tope
                    @pila[:tope]=nodo
                    @pila[:size]+=1
                    contador=@pila[:size]+1
                    @procedimientos
    .push(imprimir_la_pila())
                elsif numero>valor
                    insertar_en_pila_auxiliar(valor)
                    @procedimientos
    .push("eliminar #{valor}")
    
                    @pila[:tope]=@pila[:tope][:siguiente]
                    @procedimientos
    .push(imprimir_la_pila())
                elsif numero<valor
                    tope = @pila[:tope]
                    nodo[:siguiente]=tope
                    @pila[:tope]=nodo
                    @pila[:size]+=1
                    contador=@pila[:size]+1
                    @procedimientos
    .push(imprimir_la_pila())
                end
                contador+=1
            end
            ingreso_de_menores()
            @pila_auxiliar[:tope]=nil
            @pila_auxiliar[:size]=0
            @pila_auxiliar[:vacia]=true
        end
        
        def ordenar_pila(arreglo=[])
            size = arreglo.size
            for i in 0..size-1
              @procedimientos
.push("ingresar #{arreglo[i]}")
                nodo = {
                    valor: arreglo[i],
                    siguiente: nil
                }
                if @pila[:vacia]
                    @pila[:tope]=nodo
                    @pila[:vacia]=false
                    @pila[:size]+=1

                else
                    lim_menor(arreglo[i])
                end
            end
            # arreglo.clear
        end
        
        def imprimir_la_pila
            elemento=@pila[:tope]
            @enlace=""
            if elemento ==nil
              @enlace=""
              @enlace
            elsif elemento[:siguiente]==nil
                @enlace+="#{elemento[:valor]}"
                @enlace
            else
                @enlace+="#{elemento[:valor]}"
                begin
                    elemento = elemento[:siguiente]
                    @enlace+=" => #{elemento[:valor]}"
                end while elemento[:siguiente]!=nil
                @enlace
            end
        end
        def mostrar_tabla(arreglob)
  tabla = Terminal::Table.new do |a|
  a.title= 'Ordenar todos los datos'
  a.headings = [{value:arreglob, alignment: :center}]
  a.add_row([{value:imprimir_la_pila(), alignment: :center}])
  end
  puts tabla
  gets()
      end

      def tabla_de_procedimiento(contador, arreglob)
        aux=0
  tabla = Terminal::Table.new do |a|
  a.title= "los elementos a ordenar son: #{arreglob}"
  a.headings = [{value:'Interaccion', alignment: :center},{value:'Datos', alignment: :center}]
  for i in 0..contador-1
  a.add_row([
  aux+=1,
  @procedimientos[i]
  ])
end
  end
  return tabla
      end

      def imprimir_procedimiento(arreglob)
          size=@procedimientos.size
          contador=0
        while contador<size
          limpiar_pantalla
          print 'Ingrese (y) para ir mostrando el procedimiento paso a paso o (n) para mostrar el procedimiento completo '
          opcion=gets.chomp
          if opcion == 'y'
          puts tabla_de_procedimiento(contador+=1,arreglob)
          gets
          elsif opcion == 'n'
            contador=size
            puts tabla_de_procedimiento(size,arreglob)
            puts 'Finalizado'
            gets
          else
            puts 'la opcion que ingreso es incorrecta'
          end
        end
        # @procedimiento.clear
      end

end
