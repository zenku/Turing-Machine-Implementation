$APP_DIR = File.dirname(__FILE__)

require ($APP_DIR + "/clases/maquina_de_turing.rb")
require "highline/system_extensions"
include HighLine::SystemExtensions

system("cls")
puts "Ingrese la ENTRADA a evaluar y presion Enter al finalizar el ingreso"
puts ""
STDOUT.flush 
input = STDIN.gets.chomp 

turing = MaquinaDeTuring.create(input, ARGV[0])

system("cls")
turing.printState

char = get_character
continue = false
while continue || (char.chr != "q")
  
  if continue || char == 64 #f6
    turing.ejecutarUnPaso()
  end
  
  if char == 66 #f8
    #turing.ejecutarPrograma()
    continue = true
  end
  
  if char == 59 #f10
    system("cls")
	puts "Ingrese la nueva ENTRADA a evaluar y presion Enter al finalizar el ingreso"
	puts ""
	STDOUT.flush 
	input = STDIN.gets.chomp 
	Traza::restart
	turing = MaquinaDeTuring.create(input, ARGV[0])
  end
  
  if char == 68 #f10
    Traza::restart
    turing = MaquinaDeTuring.create(input, ARGV[0])
  end
  
  if char == 72 #ARRIBA
    turing.less
  end
  
  if char == 73 #PGUP
    turing.muchLess
  end

  if char == 80 #ABAJO
    turing.more
  end
  if char == 81 #PGDOWN
    turing.muchMore
  end
  
  if continue
    continue = turing.running
  end
  system("cls")
  turing.printState
 if !continue
  char = get_character
 end
  
end