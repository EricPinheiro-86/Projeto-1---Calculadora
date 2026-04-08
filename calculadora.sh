#!/bin/bash

#Calculadora Inteligente

# Entrada do nome do usuário
read -p "Insira seu nome: " nome_usuario
echo "Olá $nome_usuario! Bem-vindo a calculadora inteligente"

while true
do
  # Escolhendo o tipo de operação
  echo ""
  echo "Tipos de operações:"
  echo "1 - Soma"
  echo "2 - Subtração"
  echo "3 - Multiplicação"
  echo "4 - Divisão"

  read -p "$nome_usuario, qual tipo de operação gostaria de realizar? " operacao

  # Entrada dos números
  read -p "Digite o primeiro número: " num1
  read -p "Digite o segundo número: " num2

  case $operacao in
    1)
      resultado=$(echo "$num1 + $num2" | bc)
      echo "O resultado da soma é $resultado"
      ;;
    2)
      resultado=$(echo "$num1 - $num2" | bc)
      echo "O resultado da subtração é $resultado"
      ;;
    3)
      resultado=$(echo "$num1 * $num2" | bc)
      echo "O resultado da multiplicação é $resultado"
      ;;
    4)
      if [ "$num2" != "0" ]; then
        resultado=$(echo "scale=2; $num1 / $num2" | bc)
        echo "O resultado da divisão é $resultado"
      else
        echo "Não é possível dividir por zero"
      fi
      ;;
    *)
      echo "Operação inválida."
      ;;
  esac

  # Repetição da calculadora
  read -p "Deseja realizar outra operação, $nome_usuario? (s/n): " repetir

  if [[ "$repetir" != "s" && "$repetir" != "S" ]]; then
    echo "Fim da operação."
    break
  fi
done


