require 'terminal-table'
class Lista
  def initialize
    @lista ={
      tope: nil,
      fondo: nil,
      size: 0,
      vacia: true
    }
    @procedimientos= Array.new
    @enlazador=""
  end

  def obtener_anterior(contador)
    elemento=@lista[:tope]
    for i in 1..contador
      elemento=elemento[:siguiente]
    end
    return elemento
  end
  
  def condiciones(nodo,numero)
    if numero>@lista[:fondo][:valor]
      fondo = @lista[:fondo]
      fondo[:siguiente]=nodo
      @lista[:fondo]=nodo
      @lista[:size]+=1
      @procedimientos.push(mostrar_lista())
    elsif numero<@lista[:tope][:valor]
      tope = @lista[:tope]
      nodo[:siguiente]=tope
      @lista[:tope]=nodo
      @lista[:size]+=1
      @procedimientos.push(mostrar_lista())
    elsif numero==@lista[:tope][:valor]
      tope = @lista[:tope]
      nodo[:siguiente]=tope
      @lista[:tope]=nodo
      @lista[:size]+=1
      @procedimientos.push(mostrar_lista())
    else
      contador=1
      elemento = @lista[:tope][:siguiente]
      for i in 1..@lista[:size]
        if numero<elemento[:valor] || numero==elemento[:valor]
          i = @lista[:size]+1
        else
          elemento=elemento[:siguiente]
          contador+=1
        end
      end
      nodo_anterior=obtener_anterior(contador-1)
      nodo_anterior[:siguiente]=nodo
      nodo[:siguiente]=elemento
      @lista[:size]+=1
      @procedimientos.push(mostrar_lista())
  end
end
      def ordenar_lista(array=[])
        size = array.size
        for i in 0..size-1
          @procedimientos.push("ingresa: #{array[i]}")
          nodo ={
            valor: array[i],
            siguiente: nil
          }
          if @lista[:vacia]
            @lista[:tope]=nodo
            @lista[:fondo]=nodo
            @lista[:vacia]=false
            @lista[:size]+=1
            @procedimientos.push(mostrar_lista())
          else
              condiciones(nodo,array[i])

          end
        end
      end

      def mostrar_lista
          elemento=@lista[:tope]
            @enlazador=""
            if elemento ==nil
              @enlazador=""
              @enlazador
            elsif elemento[:siguiente]==nil
                @enlazador+="#{elemento[:valor]}"
                @enlazador
            else
                @enlazador+="#{elemento[:valor]}"
                begin
                    elemento = elemento[:siguiente]
                    @enlazador+=" => #{elemento[:valor]}"
                end while elemento[:siguiente]!=nil
              @enlazador
            end
        end

        def mostrar_tabla(arreglob)
  tabla = Terminal::Table.new do |a|
  a.title= 'Ordenamiento'
  a.headings = [{value:arreglob, alignment: :center}]
  a.add_row([{value:mostrar_lista(), alignment: :center}])
  end
  puts tabla
      end

      def tablade_pasos(contador,arreglob)
        aux=0
  tabla = Terminal::Table.new do |a|
  a.title= "los elementos a ordenar son: #{arreglob}"
  a.headings = [{value:'Interaccion', alignment: :center},{value:'Estructura de datos', alignment: :center}]
  for i in 0..contador-1
  a.add_row([
  aux+=1,
  @procedimientos[i]
  ])
end
  end
  return tabla
      end

      def mostrarpasos(arreglob)
          size=@procedimientos.size
          contador=0
        while contador<size
          limpiar_pantalla
          print 'Ingrese (y) para ir mostrando el procedimiento paso a paso o (n) para mostrar el procedimiento completo: '
          opc=gets.chomp
          if opc == 'y'
          puts tablade_pasos(contador+=1,arreglob)
          gets
          elsif opc == 'n'
            contador=size
            puts tablade_pasos(size,arreglob)
            puts 'Finalizad'
            gets
          else
            puts 'la opcion que ingreso es incorrecta'
          end
        end
        #@procedimientos.clear
      end
        def pasos_lista
        size = @procedimientos.size
        return size
      end
      def limpiar_lista
        @lista[:tope]=nil
        @lista[:fondo]=nil
        @lista[:size]=0
        @lista[:vacia]=true
@procedimientos.clear
      end
end