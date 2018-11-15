class Cola
    def initialize
        @cola = {
        tope: nil,
        fondo: nil,
        size: 0,
        vacia: true
      }
      @cola_mayores ={
        tope: nil,
        fondo: nil,
        size: 0,
        vacia: true
      }
      @cola_menores ={
        tope: nil,
        fondo: nil,
        size: 0,
        vacia: true
      }
      @pasos = Array.new
      @array = ""
    end
    
    def ingresar_mayores# 
      for i in 1..@cola_mayores[:size]
        valor = @cola_mayores[:tope][:valor]
        nodo = {
          valor:valor,
          siguiente: nil
        }      
        fondo = @cola[:fondo]
        fondo[:siguiente]=nodo
        @cola[:fondo]=nodo
        @cola_mayores[:tope]=@cola_mayores[:tope][:siguiente]
        @pasos.push(mostrar_cola())
      end
    end
        
    def ingresar_menores 
      for i in 1..@cola_menores [:size]
        if @cola[:tope]==nil
          valor = @cola_menores [:tope][:valor]
            nodo = {
                valor:valor,
                siguiente: nil
            }
          @cola[:tope]=nodo
          @cola[:fondo]=nodo
          @cola[:vacia]=false
          @pasos.push("cuando cola es nil"+mostrar_cola())
          @cola_menores [:tope]=@cola_menores [:tope][:siguiente]
        else
          valor = @cola_menores [:tope][:valor]
          nodo = {
            valor:valor,
            siguiente: nil
          }
          fondo = @cola[:fondo]
          fondo[:siguiente]=nodo
          @cola[:fondo]=nodo
          siguiente = @cola_menores [:tope][:siguiente]
          @cola_menores [:tope]=siguiente
          @pasos.push(">>>"+mostrar_cola())
        end
      end    
    end
  
    def ingresar_cola_mayor(valor)# 
      nodo = {
        valor: valor,
        siguiente: nil
      }
      if @cola_mayores[:vacia]
        @cola_mayores[:tope]=nodo
        @cola_mayores[:fondo]=nodo
        @cola_mayores[:vacia]=false
        @cola_mayores[:size]+=1
      else
        fondo=@cola_mayores[:fondo]
        fondo[:siguiente]=nodo
        @cola_mayores[:fondo]=nodo
        @cola_mayores[:size]+=1
      end      
    end
  
    def ingresar_cola_menor(valor)#
      @pasos.push("ingresar en aux menor"+mostrar_cola())
      nodo = {
        valor: valor,
        siguiente: nil
      }
      if @cola_menores [:vacia]
        @cola_menores [:tope]=nodo
        @cola_menores [:fondo]=nodo
        @cola_menores [:vacia]=false
        @cola_menores [:size]+=1
      else
        fondo=@cola_menores [:fondo]
        fondo[:siguiente]=nodo
        @cola_menores [:fondo]=nodo
        @cola_menores [:size]+=1
      end
        @pasos.push("-->"+mostrar_cola)
    end
  
    def vaciar(nodo,num)
      menor=0
      @pasos.push(num)
      while @cola[:tope]!=nil
        valor = @cola[:tope][:valor]
        if num>valor
          menor+=1
          ingresar_cola_menor(valor)
          @pasos.push("apartar menor: #{valor}")
        elsif num<valor
          ingresar_cola_mayor(valor)
          @pasos.push("apartar mayor: #{valor}")
        elsif num == valor
          ingresar_cola_mayor(valor)
          @pasos.push("aparatar igual: #{valor}")
        end
        @pasos.push(@cola[:tope][:valor])
        @cola[:tope]=@cola[:tope][:siguiente]
      end
      @pasos.push("*"+mostrar_cola())
      @cola[:fondo]=nil
      @cola[:tope]=nil
      @cola[:vacia]=true
      @pasos.push("+"+mostrar_cola())
      if menor>0
        ingresar_menores()
        @pasos.push("*"+mostrar_cola())
        fondo=@cola[:fondo]
        fondo[:siguiente]=nodo
        @cola[:fondo]=nodo
        @cola[:size]+=1
        ingresar_mayores()
        @pasos.push("-"+mostrar_cola())
      else
        @cola[:tope]=nodo
        @cola[:fondo]=nodo
        @cola[:size]+=1
        @cola[:vacia]=false
        ingresar_mayores()
      end
      @pasos.push("*"+mostrar_cola())
      @cola_mayores[:tope]=nil
      @cola_mayores[:fondo]=nil
      @cola_mayores[:size]=0
      @cola_mayores[:vacia]=true
      @cola_menores [:tope]=nil
      @cola_menores [:fondo]=nil
      @cola_menores [:size]=0
      @cola_menores [:vacia]=true
    end
  
    def ordenar_cola(array=[])
      size = array.size
      for i in 0..size-1
        @pasos.push("ingresar #{array[i]}")
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
    array.clear
    end
  
    def mostrar_cola
      elemento=@cola[:tope]
        @array=""
        if elemento ==nil
          @array=""
          @array
        elsif elemento[:siguiente]==nil
          @array+="#{elemento[:valor]}"
          @array
        else
          @array+="#{elemento[:valor]}"
          begin
            elemento = elemento[:siguiente]
            @array+=" => #{elemento[:valor]}"
          end while elemento[:siguiente]!=nil
          @array
        end
    end
  end