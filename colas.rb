require 'terminal-table'

class Cola
  def initialize
    @cola = {
      tope: nil,
      fondo: nil,
      size: 0,
      vacia: true
    }
    @cola_auxiliar_de_mayores ={
      tope: nil,
      fondo: nil,
      size: 0,
      vacia: true
    }
    @cola_auxiliar_de_menores={
      tope: nil,
      fondo: nil,
      size: 0,
      vacia: true
    }
    @procedimientos= Array.new
    @enlazador=""
  end

  def ingresar_mayores 
    for i in 1..@cola_auxiliar_de_mayores[:size]
      valor = @cola_auxiliar_de_mayores[:tope][:valor]
      nodo = {
          valor:valor,
          siguiente: nil
      }
      fondo = @cola[:fondo]
      fondo[:siguiente]=nodo
      @cola[:fondo]=nodo
      @cola_auxiliar_de_mayores[:tope]=@cola_auxiliar_de_mayores[:tope][:siguiente]
      @procedimientos.push(mostrar_cola())
    end    
  end

  def ingresar_menores
    for i in 1..@cola_auxiliar_de_menores[:size]
      if @cola[:tope]==nil
        valor = @cola_auxiliar_de_menores[:tope][:valor]
          nodo = {
              valor:valor,
              siguiente: nil
          }
          @cola[:tope]=nodo
          @cola[:fondo]=nodo
          @cola[:vacia]=false
          @procedimientos.push("cuando cola es nil"+mostrar_cola())
          @cola_auxiliar_de_menores[:tope]=@cola_auxiliar_de_menores[:tope][:siguiente]
      else
          valor = @cola_auxiliar_de_menores[:tope][:valor]
          nodo = {
              valor:valor,
              siguiente: nil
          }
          fondo = @cola[:fondo]
          fondo[:siguiente]=nodo
          @cola[:fondo]=nodo
          siguiente = @cola_auxiliar_de_menores[:tope][:siguiente]
          @cola_auxiliar_de_menores[:tope]=siguiente
          @procedimientos.push(">>>"+mostrar_cola())#procedimientos
        end
      end     
  end

  def ingresar_cola_mayor(valor) #INGRESA A LA COLA DE MAYORES
    nodo = {
      valor: valor,
      siguiente: nil,
    }
    if @cola_auxiliar_de_mayores[:vacia]
      @cola_auxiliar_de_mayores[:tope]=nodo
      @cola_auxiliar_de_mayores[:fondo]=nodo
      @cola_auxiliar_de_mayores[:vacia]=false
      @cola_auxiliar_de_mayores[:size]+=1
    else
      fondo=@cola_auxiliar_de_mayores[:fondo]
      fondo[:siguiente]=nodo
      @cola_auxiliar_de_mayores[:fondo]=nodo
      @cola_auxiliar_de_mayores[:size]+=1
    end   
  end

  def ingresar_cola_menor(valor)#ingresa a la cola de  menores.
    @procedimientos.push("ingresar en aux menor"+mostrar_cola())
    nodo = {
      valor: valor,
      siguiente: nil,
    }
    if @cola_auxiliar_de_menores[:vacia]
      @cola_auxiliar_de_menores[:tope]=nodo
      @cola_auxiliar_de_menores[:fondo]=nodo
      @cola_auxiliar_de_menores[:vacia]=false
      @cola_auxiliar_de_menores[:size]+=1
    else
      fondo=@cola_auxiliar_de_menores[:fondo]
      fondo[:siguiente]=nodo
      @cola_auxiliar_de_menores[:fondo]=nodo
      @cola_auxiliar_de_menores[:size]+=1
    end    
    @procedimientos.push("--"+mostrar_cola)   
  end

  def vaciar(nodo,num)  #vacia cola principal
    menor=0
    @procedimientos.push(num)
    while @cola[:tope]!=nil
      valor = @cola[:tope][:valor]
      if num>valor
        menor+=1
        ingresar_cola_menor(valor)
        @procedimientos.push("apartar menor: #{valor}")
      elsif num<valor
        ingresar_cola_mayor(valor)
        @procedimientos.push("apartar mayor: #{valor}")
      elsif num == valor
        ingresar_cola_mayor(valor)
        @procedimientos.push("aparatar igual: #{valor}")
      end
      @procedimientos.push(@cola[:tope][:valor])
      @cola[:tope]=@cola[:tope][:siguiente]           
    end
    @procedimientos.push("*"+mostrar_cola())
    @cola[:fondo]=nil
    @cola[:tope]=nil
    @cola[:vacia]=true
    @procedimientos.push("+"+mostrar_cola())
    if menor>0
      ingresar_menores()
      @procedimientos.push("*"+mostrar_cola())
      fondo=@cola[:fondo]
      fondo[:siguiente]=nodo
      @cola[:fondo]=nodo
      @cola[:size]+=1
      ingresar_mayores()
      @procedimientos.push("-"+mostrar_cola())
    else
      @cola[:tope]=nodo
      @cola[:fondo]=nodo
      @cola[:size]+=1
      @cola[:vacia]=false
      ingresar_mayores()
    end
    @procedimientos.push("*"+mostrar_cola())
    @cola_auxiliar_de_mayores[:tope]=nil
    @cola_auxiliar_de_mayores[:fondo]=nil
    @cola_auxiliar_de_mayores[:size]=0
    @cola_auxiliar_de_mayores[:vacia]=true

    @cola_auxiliar_de_menores[:tope]=nil
    @cola_auxiliar_de_menores[:fondo]=nil
    @cola_auxiliar_de_menores[:size]=0
    @cola_auxiliar_de_menores[:vacia]=true          
  end

  def ordenar_cola(array=[]) #ORDENA LA COLA
    size = array.size
    for i in 0..size-1
      @procedimientos.push("ingresar #{array[i]}")
      nodo = {
        valor: array[i],
        siguiente: nil
      }
      if @cola[:vacia]
        @cola[:tope]=nodo
        @cola[:fondo]=nodo
        @cola[:vacia]=false
        @cola[:size]+=1

      else
        if array[i]>@cola[:fondo][:valor]
          fondo = @cola[:fondo]
          fondo[:siguiente]=nodo
          @cola[:fondo]=nodo
          @cola[:size]+=1
        else
          vaciar(nodo,array[i])
        end
      end          
    end
    # array.clear
  end
  
  def mostrar_cola #MUESTRA LA COLA
    elemento=@cola[:tope]
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
    
  def mostrar_tabla(arreglob) #MUESTRA LA COLA CON TABLA
    tabla = Terminal::Table.new do |a|
      a.title= 'Datos Ordenado'
      a.headings = [{value:arreglob, alignment: :center}]
      a.add_row([{value:mostrar_cola(), alignment: :center}])
    end
    puts tabla
  end

  def mostrar_pasos #FUNCION PARA LOS PASOS
    puts @cola
    puts @cola_auxiliar_de_mayores
    puts @cola_auxiliar_de_menores
    @procedimientos.each  do |iterador|
      puts iterador
    end
  end      

end